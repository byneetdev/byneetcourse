import 'package:byneetcourseapp/src/modules/course/models/course_model_purin.dart';
import 'package:byneetcourseapp/src/modules/course/screens/android/loading_module.dart';
import 'package:byneetcourseapp/src/widgets/bouncyPageRoute_widget.dart';
import 'package:byneetcourseapp/src/widgets/cardCourseProgress_widget.dart';
import 'package:byneetcourseapp/src/widgets/customFadeAnimation_widget.dart';
import 'package:flutter/material.dart';

class ListMyCourseWidget extends StatelessWidget {
  final List<CourseModel> listMycourse;

  const ListMyCourseWidget({Key key, this.listMycourse}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: listMycourse
            .map((e) => Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          BouncyPageRoute(
                              destination: LoadingModule(
                            idCourse: e.uid,
                          )));
                    },
                    child: CustomFadeAnimation(
                      1.5,
                      CardCourseProgressWidget(
                        mycourse: e,
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
