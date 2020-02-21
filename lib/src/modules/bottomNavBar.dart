import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:byneetcourseapp/src/modules/account/screens/android/account_android.dart';
import 'package:byneetcourseapp/src/modules/home/screens/android/home_android.dart';
import 'package:byneetcourseapp/src/modules/myCourse/screens/android/myCourse_android.dart';
import 'package:byneetcourseapp/src/modules/search/screens/android/search_android.dart';
import 'package:byneetcourseapp/src/modules/wishlist/screens/android/wishlist_android.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            //home page
            HomeAndroid(),
            WishlistAndroid(),
            AccountAndroid(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Color(0xFF9BB4CE),
        selectedIndex: _currentIndex,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _currentIndex = index;
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.easeIn);
        }),
        items: [
          BottomNavyBarItem(
            inactiveColor: Colors.black26,
            icon: Icon(Icons.home),
            title: Text(
              'Home',
              style: TextStyle(color: Color(0xFFFB1002)),
            ),
            activeColor: Color(0xFFFB1002),
          ),
          BottomNavyBarItem(
            inactiveColor: Colors.black26,
            icon: Icon(Icons.favorite_border),
            title: Text('Wishlist'),
            activeColor: Color(0xFFFB1002),
          ),
          BottomNavyBarItem(
            inactiveColor: Colors.black26,
            icon: Icon(Icons.account_circle),
            title: Text('Account'),
            activeColor: Color(0xFFFB1002),
          ),
        ],
      ),
    );
  }
}
