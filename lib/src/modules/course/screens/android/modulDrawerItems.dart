import 'package:byneetcourseapp/src/modules/account/mycourse_repository.dart';
import 'package:byneetcourseapp/src/modules/course/models/course_model_purin.dart';
import 'package:byneetcourseapp/src/modules/course/models/materi_model.dart';
import 'package:byneetcourseapp/src/modules/course/screens/android/modulDetail_android.dart';
import 'package:byneetcourseapp/src/widgets/customDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModulDrawerItem extends StatefulWidget {
  ModulDrawerItem({Key key, this.listMateri}) : super(key: key);
  final List<MateriModel> listMateri;

  @override
  _ModulDrawerItemState createState() => _ModulDrawerItemState();
}

class _ModulDrawerItemState extends State<ModulDrawerItem>
    with TickerProviderStateMixin {
  HiddenDrawerController _drawerController;
  CourseModel mycourse;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var mycourse = Provider.of<MyCourseRepository>(context).myCourse;
    if (mycourse != this.mycourse) {
      this.mycourse = mycourse;
      print(mycourse.toMap().toString());
    }
  }

  @override
  void initState() {
    super.initState();

    _drawerController = HiddenDrawerController(
      // initial page tuk opening jadi misal user ke modul buka ini am pertameny t
      initialPage: MainPage(
        //nampilkan materi yang terakhir dibuka, mun baru, buka materi index ke-0
        materi: widget.listMateri.singleWhere(
            (element) => element.id == mycourse?.progress?.elementAt(-1),
            orElse: () => widget.listMateri[0]),
      ),
      // ini dikasi map jak bs mah kali ye.. jadi kau ngurus ini jam
      items: widget.listMateri
          .map(
            (e) => DrawerItem(
              materi: e,
              //PAGE untuk navigator ke UI baru
              page: MainPage(
                materi: e,
              ),
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HiddenDrawer(
        controller: _drawerController,
        header: Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: EdgeInsets.only(left: 15),
            width: 200,
            child: Column(
              children: <Widget>[
                Text(
                  "Daftar Modul",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Flutter Cross-Platform Course',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.indigo[900],
              Colors.indigo[400],
              Colors.indigo,
            ],
            // tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}
