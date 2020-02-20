import 'package:byneetcourseapp/src/modules/course/screens/android/courseGridAll_android.dart';
import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:flutter/material.dart';

class NoDataContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 17.0, vertical: 15.0),
      child: Column(
        children: <Widget>[
          ClayContainer(
            borderRadius: 16.0,
            width: MediaQuery.of(context).size.width,
            height: 200,
            color: Color(0xFFD2E0EF),
            child: Container(
              margin: EdgeInsets.all(7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  image: DecorationImage(
                    image: AssetImage('images/nodata.png'),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          SizedBox(height: 15),
          ClayContainer(
            emboss: true,
            color: Color(0xFFD2E0EF),
            borderRadius: 12,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 3.0,
                horizontal: 12.0,
              ),
              child: Text(
                "Oppss..",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          ClayContainer(
            emboss: true,
            color: Color(0xFFD2E0EF),
            borderRadius: 12,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 3.0,
                horizontal: 12.0,
              ),
              child: Text(
                "Kamu belum memilih kelas yang diinginkan",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          ClayContainer(
            color: Color(0xFFD2E0EF),
            borderRadius: 14,
            child: Container(
              margin: EdgeInsets.all(3),
              width: 150,
              height: 50,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0)),
                color: Color(0xFFFB1002),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CourseGridAll(),
                      ));
                },
                child: Text(
                  "Cari Kelas",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
