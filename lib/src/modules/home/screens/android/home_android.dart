import 'package:byneetcourseapp/src/modules/account/account_service.dart';
import 'package:byneetcourseapp/src/modules/account/models/account_model_purin.dart';
import 'package:byneetcourseapp/src/modules/course/models/course_model_purin.dart';
import 'package:byneetcourseapp/src/modules/course/screens/android/courseGridAll_android.dart';
import 'package:byneetcourseapp/src/modules/home/home_service.dart';
import 'package:byneetcourseapp/src/modules/home/models/carousel_model.dart';
import 'package:byneetcourseapp/src/modules/home/widgets/horizontalListItem_widget.dart';
import 'package:byneetcourseapp/src/modules/loading_container.dart';
import 'package:byneetcourseapp/src/modules/login/login_service.dart';
import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:byneetcourseapp/src/modules/home/widgets/carouselSwiper_widget.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeAndroid extends StatefulWidget {
  @override
  _HomeAndroidState createState() => _HomeAndroidState();
}

class _HomeAndroidState extends State<HomeAndroid>
    with AutomaticKeepAliveClientMixin<HomeAndroid> {
  //pull to refresh untuk refresh page
  final _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final user = Provider.of<LoginService>(context).user;
    return FutureBuilder<AccountModel>(
      future: AccountService().cekDataUser(user.uid, <String, dynamic>{}),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return LoadingContainer();
        }
        return Scaffold(
          backgroundColor: Color(0xFFD2E0EF),
          body: SmartRefresher(
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
                    SizedBox(height: 40.0),
                    // nama + foto profil
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          //Nama user
                          Text(
                            "Byneet Courses",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          //Foto user
                          ClayContainer(
                            height: 50,
                            width: 50,
                            borderRadius: 50,
                            color: Color(0xFFD2E0EF),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.black12,
                                backgroundImage: AdvancedNetworkImage(
                                  snapshot.data.urlImg,
                                  useDiskCache: true,
                                  cacheRule:
                                      CacheRule(maxAge: Duration(days: 7)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Custom Carousel
                    Container(
                      height: 220,
                      child: FutureBuilder<List<CarouselModel>>(
                          future: HomeService().getCarouselCollection(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState !=
                                ConnectionState.done) return LoadingContainer();
                            if (!snapshot.hasData)
                              return Center(
                                  child: Text('something bad happend.'));
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
                            return Center(
                                child: Text('something bad happend.'));
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
                        }),
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
          ),
        );
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
