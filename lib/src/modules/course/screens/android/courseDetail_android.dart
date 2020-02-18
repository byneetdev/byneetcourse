import 'package:byneetcourseapp/src/modules/course/models/course_model_purin.dart';
import 'package:byneetcourseapp/src/modules/course/widgets/screenshot_widget.dart';
import 'package:byneetcourseapp/src/modules/course/widgets/customImage_widget.dart';
import 'package:byneetcourseapp/src/modules/course/widgets/theory_widget.dart';
import 'package:byneetcourseapp/src/modules/login/login_service.dart';
import 'package:byneetcourseapp/src/modules/wishlist/wishlist_service.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CourseDetailAndroid extends StatelessWidget {
  final CourseModel kelas;
  CourseDetailAndroid({@required this.kelas});

  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LoginService>(context);

    return SafeArea(
      child: Scaffold(
        key: _key,
        // appBar:
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  color: Color(0xFFD2E0EF),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16))),
                  child: Container(
                    height: 420,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //appbar navigasi kembali
                        AppBar(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16),
                                  bottomRight: Radius.circular(16))),
                          leading: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ClayContainer(
                              width: 20,
                              height: 20,
                              borderRadius: 20,
                              color: Color(0xFFD2E0EF),
                              child: IconButton(
                                  icon: Icon(Icons.arrow_back_ios, size: 18),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),
                            ),
                          ),
                        ),
                        //Container gambarnya
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: ClayContainer(
                            color: Color(0xFFD2E0EF),
                            borderRadius: 16,
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
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    //total rating
                                    Text(
                                      "4.8",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
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
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.star,
                                          color: Color(0xFFFB1002),
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Color(0xFFFB1002),
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Color(0xFFFB1002),
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Color(0xFFFB1002),
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Color(0xFFFB1002),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    //nama creator
                                    Text(
                                      kelas.creatorName,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //Tombol favorite
                              //Jika ditekan masuk ke tab wishlist
                              //pake sqlite atau prefs
                              ClayContainer(
                                color: Color(0xFFD2E0EF),
                                borderRadius: 15,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.favorite_border,
                                    color: Color(0xFFFB1002),
                                  ),
                                  onPressed: () async {
                                    WishListService(user.user.uid)
                                        .setWishlist(kelas)
                                        .then((_) {
                                      _key.currentState.showSnackBar(SnackBar(
                                          content:
                                              Text("Disimpan di WishLish!")));
                                    });
                                  },
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //dibawah gambar
                Container(
                  margin: EdgeInsets.all(14.0),
                  // color: Colors.amber,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        kelas.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        kelas.description,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF83867C),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Screenshot",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Beberapa screenshot dalam kelas ini",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF83867C),
                        ),
                      ),
                      SizedBox(height: 20),
                      ClayContainer(
                        emboss: true,
                        color: Color(0xFFD2E0EF),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                          child: Container(
                            width: double.infinity,
                            height: 180,
                            child: ScreenshotWidget(
                              screenshot: kelas.screenshots,
                            ),
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
                      Text(
                        "Materi",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Materi yang akan dibahas pada kelas ini",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF83867C),
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
      ),
    );
  }
}
