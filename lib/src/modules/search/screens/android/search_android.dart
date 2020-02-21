import 'package:byneetcourseapp/src/tools/constColor.dart';
import 'package:byneetcourseapp/src/widgets/customFadeAnimation_widget.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';

class SearchAndroid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 17.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 30.0),
              CustomFadeAnimation(
                1.8,
                Text(
                  "Pencarian",
                  style: TextStyle(
                    fontSize: 25,
                    color: CustomColor.textColorPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              //kotak pencarian
              CustomFadeAnimation(
                2.0,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 14.0),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Cari Kelas...",
                      hintStyle:
                          TextStyle(color: CustomColor.textColorSecondary),
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.search,
                          color: CustomColor.textColorPrimary,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 35.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: CustomFadeAnimation(
                    2.2,
                    Container(
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: AssetImage("images/talent_search.png"),
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              CustomFadeAnimation(
                2.4,
                Container(
                  margin: const EdgeInsets.all(8.0),
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Temukan kelas menarik, ayo jelajahi dunia dengan ilmu pengetahuan",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: CustomColor.textColorSecondary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
