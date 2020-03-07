import 'package:byneetcourseapp/src/modules/course/models/course_model_purin.dart';
import 'package:byneetcourseapp/src/modules/course/screens/android/courseDetail_android.dart';
import 'package:byneetcourseapp/src/modules/course/services/course_service.dart';
import 'package:byneetcourseapp/src/tools/constColor.dart';
import 'package:byneetcourseapp/src/widgets/bouncyPageRoute_widget.dart';
import 'package:byneetcourseapp/src/widgets/customCardCourse_widget.dart';
import 'package:byneetcourseapp/src/widgets/customFadeAnimation_widget.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../loading_container.dart';

class CourseGridAll extends StatefulWidget {
  @override
  _CourseGridAllState createState() => _CourseGridAllState();
}

class _CourseGridAllState extends State<CourseGridAll>
    with AutomaticKeepAliveClientMixin<CourseGridAll> {
  //pull to refresh untuk refresh page
  final _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColor.background,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: CustomColor.textColorPrimary,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
      ),
      body: FutureBuilder<List<CourseModel>>(
          future: CourseService().getDataCollection(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done)
              return LoadingContainer();
            if (!snapshot.hasData)
              return Center(child: Text('something bad happend.'));
            return SmartRefresher(
              controller: _refreshController,
              enablePullDown: true,
              enablePullUp: true,
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
                margin: EdgeInsets.all(5),
                child: GridView.builder(
                  itemCount: snapshot.data.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 4.0,
                    childAspectRatio: 0.57,
                  ),
                  itemBuilder: (context, index) {
                    final kelas = snapshot.data[index];
                    return CustomFadeAnimation(
                      1.2,
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            BouncyPageRoute(
                              destination: CourseDetailAndroid(kelas: kelas),
                            ),
                          );
                        },
                        child: CustomCardCourseWidget(
                          heroTag: kelas.uid,
                          urlimage: kelas.urlimage,
                          title: kelas.title,
                          creator: kelas.creatorName,
                          rating: kelas.rating,
                          status: kelas.classStatus,
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
