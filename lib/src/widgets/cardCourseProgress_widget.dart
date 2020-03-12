import 'package:byneetcourseapp/src/modules/course/models/course_model_purin.dart';
import 'package:byneetcourseapp/src/tools/constColor.dart';
import 'package:byneetcourseapp/src/widgets/customImage_widget.dart';
import 'package:flutter/material.dart';

class CardCourseProgressWidget extends StatelessWidget {
  final CourseModel mycourse;
  CardCourseProgressWidget({this.mycourse});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 7,
        margin: EdgeInsets.symmetric(horizontal: 14.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 100,
              height: 100,
              child: CustomImageWidget(
                heroTag: mycourse.uid,
                urlimage: mycourse.urlimage,
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(height: 10),
                  Text(
                    mycourse.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      color: CustomColor.textColorPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Text(
                  //   "93% Terselesaikan",
                  //   overflow: TextOverflow.ellipsis,
                  //   style: TextStyle(
                  //     color: CustomColor.textColorSecondary,
                  //     fontSize: 15,
                  //   ),
                  // ),
                  Container(
                    child: Row(
                      // mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        // LinearProgressIndicator(
                        //   value: (((mycourse?.progress?.length ?? 0.0) /
                        //               (mycourse?.totalmateri ?? 0.0)) ??
                        //           0.0)
                        //       .floorToDouble(),
                        // ),
                        Text(((((mycourse?.progress?.length ?? 0.0) /
                                            (mycourse?.totalmateri ?? 1.0)) ??
                                        0.0) *
                                    100)
                                .floor()
                                .toString() +
                            "% [${(mycourse?.progress?.length ?? 0)}/${(mycourse?.totalmateri ?? 0)} materi]")
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      // child: ListTile(
      //   leading: SizedBox(
      //     width: 100,
      //     height: 100,
      //     child: Card(
      //       elevation: 6,
      //       shape:
      //           RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      //       child: CustomImageWidget(
      //         heroTag: "null",
      //         urlimage:
      //             "https://firebasestorage.googleapis.com/v0/b/byneet-course.appspot.com/o/98987.png?alt=media&token=8e0bef42-c551-4baa-8696-7de6a720bd43",
      //       ),
      //     ),
      //   ),
      //   title: Text(
      //     "Flutter Full-Course from Beginner to Advance",
      //     style: TextStyle(
      //       color: CustomColor.textColorPrimary,
      //       fontWeight: FontWeight.bold,
      //       fontSize: 17,
      //     ),
      //   ),
      //   subtitle: Text(
      //     "93% Terselesaikan",
      //     style: TextStyle(
      //       color: CustomColor.textColorSecondary,
      //       fontSize: 14,
      //     ),
      //   ),
      // ),
    );
  }
}
