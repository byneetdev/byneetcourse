import 'package:byneetcourseapp/src/modules/course/models/course_model_purin.dart';
import 'package:byneetcourseapp/src/modules/course/screens/android/courseGridAll_android.dart';
import 'package:byneetcourseapp/src/modules/home/models/carousel_model.dart';
import 'package:byneetcourseapp/src/modules/home/services/home_service.dart';
import 'package:byneetcourseapp/src/modules/loading_container.dart';
import 'package:byneetcourseapp/src/modules/login/services/login_service.dart';
import 'package:byneetcourseapp/src/modules/nodata_container.dart';
import 'package:byneetcourseapp/src/modules/search/screens/android/search_android.dart';
import 'package:byneetcourseapp/src/tools/constColor.dart';
import 'package:byneetcourseapp/src/widgets/bouncyPageRoute_widget.dart';
import 'package:byneetcourseapp/src/widgets/carouselSwiper_widget.dart';
import 'package:byneetcourseapp/src/widgets/customFadeAnimation_widget.dart';
import 'package:byneetcourseapp/src/widgets/horizontalListItem_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeAndroid extends StatefulWidget {
  @override
  _HomeAndroidState createState() => _HomeAndroidState();
}

class _HomeAndroidState extends State<HomeAndroid>
    with SingleTickerProviderStateMixin {
  //pull to refresh untuk refresh page
  final _refreshController = RefreshController();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LoginService>(context);
    return SmartRefresher(
      controller: _refreshController,
      header: WaterDropMaterialHeader(),
      onRefresh: () async {
        try {
          await Future.delayed(Duration(milliseconds: 1000));
          if (mounted) {
            setState(() {});
          }
          _refreshController.refreshCompleted();
        } catch (e) {
          _refreshController.refreshFailed();
        }
      },
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 40),
              // nama + foto profil
              CustomFadeAnimation(
                1.0,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.black12,
                            backgroundImage: AdvancedNetworkImage(
                              user.account.urlimage,
                              useDiskCache: true,
                              cacheRule: CacheRule(maxAge: Duration(days: 7)),
                            ),
                          ),
                          SizedBox(width: 7),
                          Text(
                            "Hi,${user.account.name}",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.search),
                        color: CustomColor.textColorPrimary,
                        iconSize: 30,
                        onPressed: () {
                          Navigator.push(context,
                              BouncyPageRoute(destination: SearchAndroid()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.0),
              //Custom Carousel
              Container(
                height: 240,
                child: FutureBuilder<List<CarouselModel>>(
                    future: HomeService().getCarouselCollection(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.done)
                        return LoadingContainer();
                      if (!snapshot.hasData) return NoDataContainer();
                      return CarouselSwiperWidget(
                        itemList: snapshot.data, //future nya
                      );
                    }),
              ),

              SizedBox(height: 15.0),
              //horizonal item
              //container list item
              FutureBuilder<List<CourseModel>>(
                future: HomeService().getRecomendedCourseCollection(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done)
                    return LoadingContainer();
                  if (!snapshot.hasData)
                    return Center(child: Text('something bad happend.'));
                  return HorizontalListWidget(
                      listTitle: "Rekomendasi untuk kamu",
                      kelasData: snapshot.data, // future
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CourseGridAll(),
                            ));
                      });
                },
              ),

              SizedBox(height: 15.0),
              //horizonal Widget
              //container list Widget
              // HorizontalListWidget(
              //   listTitle: "Best Seller",
              //   kelasData: dummyKelas, //future nya
              // ),
              SizedBox(height: 100)
            ],
          ),
        ),
      ),
    );
  }
}
