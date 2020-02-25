// import 'dart:async';
import 'package:byneetcourseapp/src/modules/account/mycourse_repository.dart';
import 'package:byneetcourseapp/src/modules/login/services/login_service.dart';
import 'package:byneetcourseapp/src/modules/login/screens/android/login_android.dart';
import 'package:byneetcourseapp/src/modules/wishlist/wishlist_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../bottomNavBar.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

/// Component UI
class _SplashScreenState extends State<SplashScreen> {
  /// Setting duration in splash screen
  // startTime() async {
  //   return new Timer(Duration(milliseconds: 4500), _navigatorPage);
  // }

  /// To navigate layout change
  // void _navigatorPage() {
  //   Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //         builder: (BuildContext context) =>
  //             Consumer<LoginService>(builder: (context, user, _) {
  //           if (user.status == Status.Unauthenticated) return LoginAndroid();
  //           return BottomNavBar();
  //         }),
  //       ));
  // }

  /// Declare startTime to InitState
  @override
  void initState() {
    super.initState();
    // startTime();
  }

  /// Code Create UI Splash Screen
  @override
  Widget build(BuildContext context) {
    //biar dak muncul screen login agik, jadi mun dah authenticated langsung home,
    final user = Provider.of<LoginService>(context);
    if (user.status == Status.Authenticated) {
      Provider.of<WishListRepository>(context, listen: false)
          .refreshRepository(user.user.uid);
      Provider.of<MyCourseRepository>(context, listen: false)
          .getData(user.user.uid);
      return BottomNavBar();
    }
    if (user.status == Status.Unauthenticated) return LoginAndroid();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Hero(
            tag: 'logoapp',
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/github.png'),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black12,
            ),
          ),
        ),
      ),
    );
  }
}
