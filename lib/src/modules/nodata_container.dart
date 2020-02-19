import 'package:flutter/material.dart';

class NoDataContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Image.asset(
          'images/nodata.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
