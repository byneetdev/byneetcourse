import 'package:byneetcourseapp/src/modules/home/models/carousel_model.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CarouselSwiperWidget extends StatelessWidget {
  final List<CarouselModel> itemList;
  CarouselSwiperWidget({@required this.itemList});

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: itemList.length,
      autoplay: true,
      itemBuilder: (context, index) {
        final carouselItem = itemList[index];
        return Padding(
          padding: EdgeInsets.all(15),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClayContainer(
              borderRadius: 15,
              surfaceColor: Color(0xFFD2E0EF),
              // color: Color(0xFFD2E0EF),
              spread: 10,
              child: Container(
                // padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFFD2E0EF),
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(carouselItem.urlimage),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            colors: [
                              Colors.black87,
                              Colors.black12,
                              Colors.black54,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 17.0,
                      top: 105.0,
                      child: Container(
                        width: 280,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              carouselItem.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 23.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        top: 10,
                        right: 17,
                        child: Chip(
                          backgroundColor: Color(0xFFFB1002),
                          label: Text(
                            carouselItem.classStatus,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
