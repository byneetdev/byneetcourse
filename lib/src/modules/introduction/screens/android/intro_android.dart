import 'package:byneetcourseapp/src/modules/login/screens/android/login_android.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class IntroAndroid extends StatefulWidget {
  @override
  _IntroAndroidState createState() => _IntroAndroidState();
}

class _IntroAndroidState extends State<IntroAndroid> {
  List<Slide> slides = new List();

  Function goToTab;
  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "Welcome",
        styleTitle: TextStyle(
            color: Color(0xFF121213),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.",
        styleDescription: TextStyle(
            color: Color(0xFFA8A8A9),
            fontSize: 16.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "images/intro.png",
      ),
    );
    slides.add(
      new Slide(
        title: "MUSEUM",
        styleTitle: TextStyle(
            color: Color(0xFF121213),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Ye indulgence unreserved connection alteration appearance",
        styleDescription: TextStyle(
            color: Color(0xFFA8A8A9),
            fontSize: 16.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "images/intro.png",
      ),
    );
    slides.add(
      new Slide(
        title: "COFFEE SHOP",
        styleTitle: TextStyle(
            color: Color(0xFF121213),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        styleDescription: TextStyle(
            color: Color(0xFFA8A8A9),
            fontSize: 16.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "images/intro.png",
      ),
    );
  }

  void onDonePress() {
    // Back to the first tab
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginAndroid(),
        ));
  }

  void onTabChangeCompleted(index) {
    // Index of current tab is focused
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Colors.white,
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Colors.white,
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Colors.white,
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = new List();
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: EdgeInsets.only(bottom: 60.0, top: 60.0),
          child: ListView(
            children: <Widget>[
              GestureDetector(
                  child: Image.asset(
                currentSlide.pathImage,
                width: 200.0,
                height: 200.0,
                fit: BoxFit.contain,
              )),
              Container(
                child: Text(
                  currentSlide.title,
                  style: currentSlide.styleTitle,
                  textAlign: TextAlign.center,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
              Container(
                child: Text(
                  currentSlide.description,
                  style: currentSlide.styleDescription,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
            ],
          ),
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.0),
        child: IntroSlider(
          // List slides
          slides: this.slides,

          // Skip button
          renderSkipBtn: this.renderSkipBtn(),
          colorSkipBtn: Color(0xFFFE3B07),
          highlightColorSkipBtn: Color(0xFFFE3B07),

          // Next button
          renderNextBtn: this.renderNextBtn(),

          // Done button
          renderDoneBtn: this.renderDoneBtn(),
          onDonePress: this.onDonePress,
          colorDoneBtn: Color(0xFFFE3B07),
          highlightColorDoneBtn: Color(0xFFFE3B07),

          // Dot indicator
          colorDot: Color(0xFFFE3B07),
          sizeDot: 13.0,
          typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,

          // Tabs
          listCustomTabs: this.renderListCustomTabs(),
          backgroundColorAllSlides: Colors.white,
          refFuncGoToTab: (refFunc) {
            this.goToTab = refFunc;
          },

          // Show or hide status bar
          shouldHideStatusBar: true,

          // On tab change completed
          onTabChangeCompleted: this.onTabChangeCompleted,
        ),
      ),
    );
  }
}
