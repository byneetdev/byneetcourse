import 'package:byneetcourseapp/dummy/model/screenshot.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewAndroid extends StatelessWidget {
  final Screenshot screenshot;
  PhotoViewAndroid({@required this.screenshot});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Hero(
            tag: screenshot.urlimage,
            child: PhotoView(imageProvider: AssetImage(screenshot.urlimage))),
      ),
    );
  }
}
