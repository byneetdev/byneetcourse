import 'package:byneetcourseapp/src/modules/course/course_service.dart';
import 'package:byneetcourseapp/src/modules/course/models/course_model_purin.dart';
import 'package:byneetcourseapp/src/modules/course/screens/android/courseDetail_android.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';

import '../../../loading_container.dart';

class CourseGridAll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClayContainer(
            width: 28,
            height: 28,
            borderRadius: 28,
            color: Color(0xFFD2E0EF),
            child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
        ),
      ),
      body: FutureBuilder<List<CourseModel>>(
          future: CourseService().getDataCollection(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done)
              return LoadingContainer();
            if (!snapshot.hasData)
              return Center(child: Text('something bad happend.'));
            return Container(
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
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  final kelas = snapshot.data[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CourseDetailAndroid(kelas: kelas),
                          ));
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: ClayContainer(
                        borderRadius: 18,
                        // height: 265,
                        width: 265,
                        // spread: 0.10,
                        color: Color(0xFFD2E0EF),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            //gambar
                            Hero(
                              tag: kelas.name,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 130.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: AssetImage(kelas.urlimage),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),

                            //Nama kelas
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ClayContainer(
                                emboss: true,
                                color: Color(0xFFD2E0EF),
                                borderRadius: 15,
                                spread: 0.5,
                                width: MediaQuery.of(context).size.width,
                                height: 115,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text(
                                        kelas.name,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "Dicky Reynaldi, Ph.D",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xFF83867C),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: <Widget>[
                                          ClayContainer(
                                            color: Color(0xFFD2E0EF),
                                            borderRadius: 13,
                                            emboss: true,
                                            curveType: CurveType.convex,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4.0,
                                                      horizontal: 7.0),
                                              child: Text(
                                                kelas.status,
                                                style: TextStyle(
                                                  fontSize: 13.0,
                                                  color: Color(0xFF15140D),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 13),
                                          ClayContainer(
                                            color: Color(0xFFD2E0EF),
                                            emboss: true,
                                            curveType: CurveType.convex,
                                            borderRadius: 13,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4.0,
                                                      horizontal: 7.0),
                                              child: Row(
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.star,
                                                    size: 20,
                                                    color: Color(0xFFFB1002),
                                                  ),
                                                  SizedBox(width: 10),
                                                  Text(
                                                    "4.8",
                                                    style: TextStyle(
                                                      fontSize: 13.0,
                                                      color: Color(0xFF15140D),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
