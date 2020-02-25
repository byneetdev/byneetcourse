import 'package:byneetcourseapp/src/modules/course/screens/android/photoview_android.dart';
import 'package:byneetcourseapp/src/widgets/customImage_widget.dart';
import 'package:flutter/material.dart';

class ScreenshotWidget extends StatelessWidget {
  final List<String> screenshot;
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
                  index: index,
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
            child: AspectRatio(
              aspectRatio: 2.5 / 3.0,
              child: CustomImageWidget(
                heroTag: screenshotImage + index.toString(),
                urlimage: screenshotImage,
              ),
            ),
          ),
        );
      },
    );
  }
}
