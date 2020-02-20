import 'package:byneetcourseapp/src/modules/home/models/carousel_model.dart';
import 'package:byneetcourseapp/src/tools/constColor.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CarouselSwiperWidget extends StatelessWidget {
  final List<CarouselModel> itemList;
  CarouselSwiperWidget({@required this.itemList});

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: itemList.length,
      autoplay: true,
      itemWidth: 250,
      // itemHeight: 200,
      layout: SwiperLayout.CUSTOM,
      customLayoutOption: new CustomLayoutOption(startIndex: -1, stateCount: 3)
          .addRotate([-45.0 / 180, 0.0, 45.0 / 180]).addTranslate([
        new Offset(-370.0, -40.0),
        new Offset(0.0, 0.0),
        new Offset(370.0, -40.0)
      ]),
      itemBuilder: (context, index) {
        final carouselItem = itemList[index];
        return InkWell(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    width: 250,
                    height: 150,
                    child: TransitionToImage(
                      borderRadius: BorderRadius.circular(16),
                      image: AdvancedNetworkImage(
                        carouselItem.urlimage,
                        useDiskCache: true,
                      ),
                      fit: BoxFit.cover,
                      placeholder: Container(
                        width: 100,
                        height: 100,
                        child: Center(
                          child: Icon(Icons.error),
                        ),
                      ),
                      loadingWidget: Container(
                        width: 100,
                        height: 100,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  carouselItem.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 20,
                    color: CustomColor.textColorPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  carouselItem.classStatus,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    color: CustomColor.textColorSecondary,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
