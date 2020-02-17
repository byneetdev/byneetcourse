import 'package:byneetcourseapp/dummy/listItem/dummyCarousel.dart';
import 'package:byneetcourseapp/dummy/listItem/dummyClass.dart';
import 'package:byneetcourseapp/src/modules/course/screens/android/courseGridAll_android.dart';
import 'package:byneetcourseapp/src/modules/home/widgets/horizontalListItem_widget.dart';
import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:byneetcourseapp/src/modules/home/widgets/carouselSwiper_widget.dart';

class HomeAndroid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD2E0EF),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 40.0),
              // nama + foto profil
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    //Nama user
                    Text(
                      "Halo, Veranda",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    //Foto user
                    ClayContainer(
                      height: 50,
                      width: 50,
                      borderRadius: 50,
                      color: Color(0xFFD2E0EF),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.black12,
                          backgroundImage: AssetImage("images/byneet3.png"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //Custom Carousel
              Container(
                height: 220,
                child: CarouselSwiperWidget(
                  itemList: dummyCarousel, //future nya
                ),
              ),
              SizedBox(height: 15.0),
              //horizonal item
              //container list item
              HorizontalListWidget(
                  listTitle: "Rekomendasi untuk kamu",
                  kelasData: dummyKelas, // future
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CourseGridAll(),
                        ));
                  }),
              SizedBox(height: 15.0),
              //horizonal Widget
              //container list Widget
              // HorizontalListWidget(
              //   listTitle: "Best Seller",
              //   kelasData: dummyKelas, //future nya
              // ),
              SizedBox(height: 100)
            ],
          ),
        ),
      ),
    );
  }
}
