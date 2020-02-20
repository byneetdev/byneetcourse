import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';

class CustomImageWidget extends StatelessWidget {
  final String heroTag;
  final String urlimage;
  CustomImageWidget({
    @required this.heroTag,
    @required this.urlimage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (heroTag != null)
          ? Hero(tag: heroTag, child: _imageWidget())
          : _imageWidget(),
    );
  }

  Widget _imageWidget() {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: TransitionToImage(
          image: AdvancedNetworkImage(
            urlimage,
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
    );
  }
}
