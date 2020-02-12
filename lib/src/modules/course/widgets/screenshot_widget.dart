import 'package:byneetcourseapp/dummy/kelas.dart';
import 'package:byneetcourseapp/src/modules/course/screens/android/photoview_android.dart';
import 'package:flutter/material.dart';

class ScreenshotWidget extends StatelessWidget {
  final List<Screenshot> screenshot;
  ScreenshotWidget({@required this.screenshot});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenshot.length,
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final screenshotImage = screenshot[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PhotoViewAndroid(
                  screenshot: screenshotImage,
                ),
              ),
            );
          },
          child: Card(
            margin: EdgeInsets.only(right: 22),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Hero(
              tag: screenshotImage.urlimage,
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage(screenshotImage.urlimage),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          ),
        );
      },
    );
  }
}
