import 'package:byneetcourseapp/src/modules/course/models/course_model_purin.dart';
import 'package:byneetcourseapp/src/modules/course/screens/android/courseDetail_android.dart';
import 'package:byneetcourseapp/src/widgets/bouncyPageRoute_widget.dart';
import 'package:byneetcourseapp/src/widgets/customFadeAnimation_widget.dart';
import 'package:byneetcourseapp/src/widgets/customImage_widget.dart';
import 'package:flutter/material.dart';

class WishListWidget extends StatefulWidget {
  final List<CourseModel> kelas;
  WishListWidget({@required this.kelas});

  @override
  _WishListWidgetState createState() => _WishListWidgetState();
}

class _WishListWidgetState extends State<WishListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.kelas.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final kelasData = widget.kelas[index];

        return CustomFadeAnimation(
          1.1,
          Dismissible(
            direction: DismissDirection.endToStart,
            background: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 15.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  gradient: LinearGradient(
                    colors: [
                      Colors.red[50],
                      Colors.red[200],
                      Colors.redAccent,
                      Colors.red,
                    ],
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  SizedBox(width: 12),
                  Text("Hapus",
                      style: TextStyle(fontSize: 17, color: Colors.white)),
                ],
              ),
            ),
            // secondaryBackground: Container(
            //   color: Colors.red[200],
            //   child: Icon(Icons.delete),
            // ),
            key: ObjectKey(widget.kelas),
            onDismissed: (direction) {
              //tuk hapus wislist item
            },

            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  BouncyPageRoute(
                    destination: CourseDetailAndroid(
                      kelas: kelasData,
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: <Widget>[
                      //Gambar wishlist
                      SizedBox(
                        width: 110,
                        height: 120,
                        child: CustomImageWidget(
                          heroTag: kelasData.uid,
                          urlimage: kelasData.urlimage,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  //Nama item wishlist
                                  Text(
                                    kelasData.title,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: Color(0xFF15140D),
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      //Nama creator
                                      Container(
                                        width: 120,
                                        child: Text(
                                          "Dicky Reynaldi, Ph.D",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Color(0xFF83867C),
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                      //status kelas
                                      Container(
                                        width: 70,
                                        padding:
                                            EdgeInsets.fromLTRB(5, 3, 5, 3),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFB1002),
                                          borderRadius:
                                              BorderRadius.circular(13),
                                        ),
                                        child: Text(
                                          kelasData.classStatus,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                      // ClayContainer(
                                      //   color: Color(0xFFD2E0EF),
                                      //   borderRadius: 13,
                                      //   emboss: true,
                                      //   spread: 1,
                                      //   curveType: CurveType.convex,
                                      //   child: Padding(
                                      //     padding: const EdgeInsets.all(4.0),
                                      //     child: Text(
                                      //       kelasData.status,
                                      //       overflow: TextOverflow.ellipsis,
                                      //       maxLines: 2,
                                      //       style: TextStyle(
                                      //         // color: Color(0xFF83867C),
                                      //         color: Colors.black,
                                      //         fontSize: 12,
                                      //         fontWeight: FontWeight.bold,
                                      //       ),
                                      //     ),
                                      //   ),
                                      // )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
