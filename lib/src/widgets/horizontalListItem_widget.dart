import 'package:byneetcourseapp/src/modules/course/models/course_model_purin.dart';
import 'package:byneetcourseapp/src/modules/course/screens/android/courseDetail_android.dart';
import 'package:byneetcourseapp/src/widgets/bouncyPageRoute_widget.dart';
import 'package:byneetcourseapp/src/widgets/customCardCourse_widget.dart';
import 'package:byneetcourseapp/src/widgets/customFadeAnimation_widget.dart';
import 'package:flutter/material.dart';

class HorizontalListWidget extends StatelessWidget {
  final String listTitle;
  final List<CourseModel> kelasData;
  final Function onPressed;
  // final Stri
  HorizontalListWidget(
      {@required this.listTitle,
      @required this.kelasData,
      @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CustomFadeAnimation(
            1.7,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    //judul list horizontal
                    listTitle,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF15140D),
                    ),
                  ),
                  //tombol navigasi ke list all
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    iconSize: 20,
                    onPressed: onPressed,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 14.0),
          //mengambil data kelas
          Container(
            margin: EdgeInsets.only(left: 17.0),
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: FutureItemList(
              kelasData: kelasData,
            ),
          ),
        ],
      ),
    );
  }
}

class FutureItemList extends StatelessWidget {
  final List<CourseModel> kelasData;
  FutureItemList({this.kelasData});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: kelasData.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        //variabel memudahkan untuk get
        var kelas = kelasData[index];

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              BouncyPageRoute(
                destination: CourseDetailAndroid(kelas: kelas),
              ),
            );
          },
          child: CustomFadeAnimation(
              1.9,
              CustomCardCourseWidget(
                heroTag: kelas.uid,
                urlimage: kelas.urlimage,
                title: kelas.title,
                creator: kelas.creatorName,
                rating: kelas.rating,
                status: kelas.classStatus,
              )),
        );
      },
    );
  }
}
