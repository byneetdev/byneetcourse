import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewAndroid extends StatelessWidget {
  final String screenshot;
  final int index;
  PhotoViewAndroid({@required this.screenshot, this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Hero(
            tag: screenshot + index.toString(),
            child: PhotoView(imageProvider: NetworkImage(screenshot))),
      ),
    );
  }
}
