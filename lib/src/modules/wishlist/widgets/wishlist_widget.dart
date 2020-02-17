import 'package:byneetcourseapp/dummy/model/kelas.dart';
import 'package:byneetcourseapp/src/modules/course/screens/android/courseDetail_android.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';

class WishListWidget extends StatelessWidget {
  final List<Kelas> kelas;
  WishListWidget({@required this.kelas});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: kelas.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final kelasData = kelas[index];
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseDetailAndroid(
                    kelas: kelasData,
                  ),
                ));
          },
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            color: Color(0xFFD2E0EF),
            margin: EdgeInsets.all(12),
            child: ClayContainer(
              width: MediaQuery.of(context).size.width,
              height: 120.0,
              borderRadius: 16,
              color: Color(0xFFD2E0EF),
              child: Row(
                children: <Widget>[
                  //Gambar wishlist
                  Hero(
                    tag: kelasData.title,
                    child: Container(
                      width: 110.0,
                      height: 120.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: AssetImage(kelasData.urlimage),
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClayContainer(
                        emboss: true,
                        color: Color(0xFFD2E0EF),
                        borderRadius: 16,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                    padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFB1002),
                                      borderRadius: BorderRadius.circular(13),
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
        );
      },
    );
  }
}
