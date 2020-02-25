import 'package:byneetcourseapp/src/tools/constColor.dart';
import 'package:byneetcourseapp/src/widgets/customImage_widget.dart';
import 'package:flutter/material.dart';

class CustomCardCourseWidget extends StatelessWidget {
  final String heroTag;
  final String urlimage;
  final String title;
  final String creator;
  final String status;
  final int rating;
  CustomCardCourseWidget({
    this.heroTag,
    @required this.urlimage,
    @required this.title,
    @required this.creator,
    @required this.rating,
    @required this.status,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Container(
        height: 320,
        width: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //gambar
            Expanded(
              // aspectRatio: 6.0 / 3.5,
              child: CustomImageWidget(
                heroTag: heroTag,
                urlimage: urlimage,
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
                    title,
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
                    creator,
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
                          status ?? "",
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
    );
  }
}
