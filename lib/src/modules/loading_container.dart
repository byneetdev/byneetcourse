import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // color: Colors.black12,
        child: SpinKitFadingCircle(
          color: Colors.indigo,
          size: 50.0,
        ),
      ),
    );
  }
}
