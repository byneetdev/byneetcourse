import 'package:byneetcourseapp/src/modules/course/models/course_model_purin.dart';
import 'package:byneetcourseapp/src/modules/course/widgets/screenshot_widget.dart';
import 'package:byneetcourseapp/src/modules/course/widgets/theory_widget.dart';
import 'package:byneetcourseapp/src/modules/login/services/login_service.dart';
import 'package:byneetcourseapp/src/modules/wishlist/wishlist_service.dart';
import 'package:byneetcourseapp/src/tools/constColor.dart';
import 'package:byneetcourseapp/src/widgets/customFadeAnimation_widget.dart';
import 'package:byneetcourseapp/src/widgets/customImage_widget.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CourseDetailAndroid extends StatelessWidget {
  final CourseModel kelas;
  CourseDetailAndroid({@required this.kelas});

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LoginService>(context);

    return SafeArea(
      child: Scaffold(
        key: _key,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: CustomColor.background,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: CustomColor.textColorPrimary,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: IconButton(
                icon: Icon(
                  Icons.bookmark_border,
                  color: CustomColor.textColorPrimary,
                ),
                onPressed: null,
                iconSize: 30,
              ),
            )
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(14.0),
                  // color: Colors.amber,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CustomFadeAnimation(
                        1.2,
                        Text(
                          kelas.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomFadeAnimation(
                        1.3,
                        Text(
                          "creator: ${kelas.creatorName}",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF83867C),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Container(
                          child: AspectRatio(
                            aspectRatio: 4.5 / 3.0, //? tuk ukuran gambar
                            child: CustomImageWidget(
                              heroTag: kelas.uid,
                              urlimage: kelas.urlimage,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Container(
                          child: CustomFadeAnimation(
                            1.4,
                            Text(
                              kelas.description,
                              style: TextStyle(
                                fontSize: 17,
                                // color: CustomColor.textColorSecondary,
                                // fontWeight:
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                      ),
                      CustomFadeAnimation(
                        1.5,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                //total rating
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      color: Color(0xFFFB1002),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "4.8",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                // kalo dipake
                                Text(
                                  "23261 reviews",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF83867C),
                                  ),
                                ),
                                //nanti diganti rating icon.
                                //sementara gini jak lok wkwk
                                SizedBox(height: 10),
                                //nama creator
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                //dibawah gambar
                Padding(
                  padding: EdgeInsets.only(left: 14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CustomFadeAnimation(
                        1.6,
                        Text(
                          "Screenshot",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      CustomFadeAnimation(
                        1.7,
                        Text(
                          "Beberapa screenshot dalam kelas ini",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF83867C),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                        child: Container(
                          width: double.infinity,
                          height: 180,
                          child: ScreenshotWidget(
                            screenshot: kelas.screenshots,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CustomFadeAnimation(
                        1.8,
                        Text(
                          "Materi",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      CustomFadeAnimation(
                        1.9,
                        Text(
                          "Materi yang akan dibahas pada kelas ini",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF83867C),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),

                      //? Expansion tile materi2
                      TheoryWidget(theory: kelas.theories),
                    ],
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Text(
            "Daftar",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: CustomColor.buttonColor,
        ),
      ),
    );
  }
}
