import 'package:byneetcourseapp/src/modules/account/mycourse_repository.dart';
import 'package:byneetcourseapp/src/modules/course/models/materi_model.dart';
import 'package:byneetcourseapp/src/modules/course/services/materi_repository.dart';
import 'package:byneetcourseapp/src/modules/login/services/login_service.dart';
import 'package:byneetcourseapp/src/widgets/customDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends DrawerContent {
  final MateriModel materi;
  MainPage({Key key, this.materi});
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final materiprov = Provider.of<MateriRepository>(context);
    final mycourse = Provider.of<MyCourseRepository>(context);
    final user = Provider.of<LoginService>(context);
    mycourse.updateProgressDone(user.user.uid, mycourse.myCourse.uid,
        widget.materi.id, materiprov.listMateri.length);
    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                  child: Material(
                    shadowColor: Colors.transparent,
                    color: Colors.transparent,
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                      onPressed: widget.onMenuPressed,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(widget.materi.title),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
