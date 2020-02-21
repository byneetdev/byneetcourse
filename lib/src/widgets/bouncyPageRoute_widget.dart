import 'package:flutter/material.dart';

class BouncyPageRoute extends PageRouteBuilder {
  final Widget destination;

  BouncyPageRoute({this.destination})
      : super(
          transitionDuration: Duration(milliseconds: 1000),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            animation =
                CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
            return ScaleTransition(
              scale: animation,
              alignment: Alignment.center,
              child: child,
            );
          },
          pageBuilder: (context, animation, secondaryAnimation) {
            return destination;
          },
        );
}
