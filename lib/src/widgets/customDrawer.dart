import 'package:byneetcourseapp/src/modules/account/mycourse_repository.dart';
import 'package:byneetcourseapp/src/modules/course/models/materi_model.dart';
import 'package:byneetcourseapp/src/modules/login/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HiddenDrawerController {
  HiddenDrawerController({this.items, @required DrawerContent initialPage}) {
    this.page = initialPage;
  }
  List<DrawerItem> items;
  Function open;
  Function close;
  DrawerContent page;
}

class DrawerContent extends StatefulWidget {
  Function onMenuPressed;
  State<StatefulWidget> createState() {
    return null;
  }
}

class DrawerItem extends StatelessWidget {
  DrawerItem({this.onPressed, this.icon, this.text, this.page, this.materi});
  Function onPressed;
  final Widget icon;
  final Widget text;
  final DrawerContent page;

  final MateriModel materi;

  @override
  Widget build(BuildContext context) {
    final mycourse = Provider.of<MyCourseRepository>(context);
    final user = Provider.of<LoginService>(context);
    print(materi.id);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            mycourse.updateProgressDone(
                user.user.uid, mycourse.myCourse.uid, materi.id);
            onPressed();
          },
          child: Card(
            elevation: 7,
            margin: EdgeInsets.only(left: 14, bottom: 10),
            child: Container(
              width: 200,
              height: 50,
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 8),
                    child: Icon(
                        mycourse.isDone(materi.id)
                            ? Icons.done
                            : Icons.play_arrow,
                        color: Colors.green),
                  ),
                  Expanded(
                    child: Text(
                      materi.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HiddenDrawer extends StatefulWidget {
  HiddenDrawer({this.header, this.decoration, this.controller});
  final BoxDecoration decoration;
  final Widget header;
  final HiddenDrawerController controller;
  @override
  _HiddenDrawerState createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer>
    with TickerProviderStateMixin {
  bool isMenuOpen = false;
  bool isMenudragging = false;
  Animation<double> animation, scaleAnimation;
  Animation<BorderRadius> radiusAnimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
    scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.86).animate(animationController);
    radiusAnimation = BorderRadiusTween(
            begin: BorderRadius.circular(0.0), end: BorderRadius.circular(32))
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.ease));
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  drawerItems() {
    return widget.controller.items.map((DrawerItem item) {
      // if (item.onPressed == null) {
      //   item.onPressed = () {
      //     widget.controller.page = item.page;
      //     widget.controller.close();
      //   };
      // }
      item.onPressed = () {
        widget.controller.page = item.page;
        widget.controller.close();
      };
      item.page.onMenuPressed = menuPress;
      return item;
    }).toList();
  }

  menuPress() {
    isMenuOpen ? closeDrawer() : openDrawer();
  }

  closeDrawer() {
    animationController.reverse();
    setState(() {
      isMenuOpen = false;
    });
  }

  openDrawer() {
    animationController.forward();
    setState(() {
      isMenuOpen = true;
    });
  }

  animations() {
    if (isMenudragging) {
      var opened = false;
      setState(() {
        isMenudragging = false;
      });
      if (animationController.value >= 0.4) {
        animationController.forward();
        opened = true;
      } else {
        animationController.reverse();
      }
      setState(() {
        isMenuOpen = opened;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    widget.controller.page.onMenuPressed = menuPress;
    widget.controller.close = closeDrawer;
    widget.controller.open = openDrawer;
    return Listener(
      onPointerDown: (PointerDownEvent event) {
        if (isMenuOpen &&
            event.position.dx / MediaQuery.of(context).size.width >= 0.66) {
          closeDrawer();
        } else {
          setState(() {
            isMenudragging = (!isMenudragging && event.position.dx <= 8.0);
          });
        }
      },
      onPointerMove: (PointerMoveEvent event) {
        if (isMenudragging) {
          animationController.value =
              event.position.dx / MediaQuery.of(context).size.width;
        }
      },
      onPointerUp: (PointerUpEvent event) {
        animations();
      },
      onPointerCancel: (PointerCancelEvent event) {
        animations();
      },
      child: Stack(
        children: <Widget>[
          Container(
            decoration: widget.decoration,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 64.0),
              child: ListView(
                children: <Widget>[
                  Container(
                    child: widget.header,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: drawerItems())
                ],
              ),
            ),
          ),
          Transform.scale(
            scale: scaleAnimation.value,
            child: Transform.translate(
                offset: Offset(
                    MediaQuery.of(context).size.width * 0.66 * animation.value,
                    0.0),
                child: AbsorbPointer(
                  absorbing: isMenuOpen,
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 32),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(44)),
                                child: Container(
                                  color: Colors.white.withAlpha(128),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: animation.value * 16),
                        child: ClipRRect(
                          borderRadius: radiusAnimation.value,
                          child: Container(
                            color: Colors.white,
                            child: widget.controller.page,
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
