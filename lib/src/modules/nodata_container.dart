import 'package:byneetcourseapp/src/modules/course/screens/android/courseGridAll_android.dart';
import 'package:byneetcourseapp/src/tools/constColor.dart';
import 'package:byneetcourseapp/src/widgets/customFadeAnimation_widget.dart';
import 'package:flutter/material.dart';

class NoDataContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 17.0, vertical: 15.0),
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: CustomFadeAnimation(
              1.2,
              Container(
                margin: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  image: DecorationImage(
                    image: AssetImage('images/404_illustration.jpg'),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: CustomColor.textColorSecondary,
                      blurRadius:
                          10.0, // has the effect of softening the shadow
                      spreadRadius:
                          2.0, // has the effect of extending the shadow
                      offset: Offset(
                        2.0, // horizontal, move right 2
                        2.0, // vertical, move down 2
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          CustomFadeAnimation(
            1.3,
            Container(
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
          ),
          SizedBox(height: 15),
          CustomFadeAnimation(
            1.4,
            Container(
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
          ),
          SizedBox(height: 25),
          CustomFadeAnimation(
            1.5,
            Container(
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
            ),
          )
        ],
      ),
    );
  }
}
