import 'package:byneetcourseapp/src/modules/account/widgets/account_widget.dart';
import 'package:byneetcourseapp/src/modules/login/services/login_service.dart';
import 'package:byneetcourseapp/src/tools/constColor.dart';
import 'package:byneetcourseapp/src/widgets/cardCourseProgress_widget.dart';
import 'package:byneetcourseapp/src/widgets/customFadeAnimation_widget.dart';
import 'package:byneetcourseapp/src/widgets/customImage_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountAndroid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final user = Provider.of<LoginService>(context);
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomFadeAnimation(
                1.0,
                Container(
                  width: width,
                  height: 250,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  decoration: BoxDecoration(
                    color: CustomColor.buttonColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      CustomFadeAnimation(
                        1.2,
                        SizedBox(
                          width: 140,
                          child: CustomImageWidget(
                              heroTag: user.account.id,
                              urlimage: user.account.urlimage),
                        ),
                      ),
                      SizedBox(width: 17),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            CustomFadeAnimation(
                              1.0,
                              Text(
                                user.account.name,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 23,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            CustomFadeAnimation(
                              1.1,
                              Text(
                                user.account.skill ?? "Belum mengisi keahlian",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            CustomFadeAnimation(
                              1.2,
                              Row(
                                children: <Widget>[
                                  _buildCards(150, "Total Kelas"),
                                  SizedBox(width: 15),
                                  _buildCards(12, "Kelas Selesai"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 35),
              CustomFadeAnimation(
                1.4,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  // width: double.infinity,
                  child: Text(
                    "Kelasku",
                    style: TextStyle(
                      color: CustomColor.textColorPrimary,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              //tuk sementare gini jak lok
              //nanti kalo class udah work baru colok widget ini
              CustomFadeAnimation(
                1.5,
                CardCourseProgressWidget(
                  title: "Flutter Full-Course from Beginner to Advance",
                  urlimage:
                      "https://firebasestorage.googleapis.com/v0/b/byneet-course.appspot.com/o/98987.png?alt=media&token=8e0bef42-c551-4baa-8696-7de6a720bd43",
                ),
              ),
              SizedBox(height: 15),
              CustomFadeAnimation(
                1.6,
                CardCourseProgressWidget(
                  title: "Phyton Masterclass Guide for Expert",
                  urlimage:
                      "https://firebasestorage.googleapis.com/v0/b/byneet-course.appspot.com/o/98987.png?alt=media&token=8e0bef42-c551-4baa-8696-7de6a720bd43",
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCards(int total, String title) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            total.toString() ?? "0",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
