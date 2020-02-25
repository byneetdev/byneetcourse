import 'package:byneetcourseapp/src/modules/account/screens/android/account_android.dart';
import 'package:byneetcourseapp/src/modules/home/screens/android/home_android.dart';
import 'package:byneetcourseapp/src/modules/wishlist/screens/android/wishlist_android.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  // int _currentIndex = 0;
  // PageController _pageController;

  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  final _tabs = [
    HomeAndroid(),
    WishlistAndroid(),
    AccountAndroid(),
  ];

  @override
  void initState() {
    super.initState();
    // _pageController = PageController();
  }

  @override
  void dispose() {
    // _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_page],
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 50.0,
        items: [
          Icon(LineIcons.home, color: Colors.white, size: 30),
          Icon(LineIcons.heart_o, color: Colors.white, size: 30),
          Icon(LineIcons.user, color: Colors.white, size: 30),
        ],
        color: Colors.indigo,
        buttonBackgroundColor: Colors.indigo[600],
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}
