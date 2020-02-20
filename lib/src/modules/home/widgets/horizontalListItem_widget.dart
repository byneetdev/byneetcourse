import 'package:byneetcourseapp/src/modules/course/models/course_model_purin.dart';
import 'package:byneetcourseapp/src/modules/course/screens/android/courseDetail_android.dart';
import 'package:byneetcourseapp/src/tools/constColor.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:byneetcourseapp/src/modules/course/widgets/customImage_widget.dart';

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
                MaterialPageRoute(
                  builder: (context) => CourseDetailAndroid(kelas: kelas),
                ));
          },
          child: Card(
            elevation: 7,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: Container(
              height: 320,
              width: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //gambar
                  AspectRatio(
                    aspectRatio: 6.0 / 3.5,
                    child: CustomImageWidget(
                      heroTag: kelas.uid,
                      urlimage: kelas.urlimage,
                    ),
                  ),
                  SizedBox(height: 5),
                  //Nama kelas
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          kelas.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: CustomColor.textColorPrimary,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          kelas.creatorName,
                          overflow: TextOverflow.ellipsis,
                          // maxLines: 2,
                          style: TextStyle(
                            fontSize: 15,
                            color: CustomColor.textColorSecondary,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.0),
                                color: CustomColor.buttonColor,
                              ),
                              child: Text(
                                kelas.classStatus ?? "",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 13),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFFB1002),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "4.8",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Color(0xFF15140D),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
