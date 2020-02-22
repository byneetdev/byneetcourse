import 'package:byneetcourseapp/src/modules/course/screens/android/modulDetail_android.dart';
import 'package:byneetcourseapp/src/widgets/customDrawer.dart';
import 'package:flutter/material.dart';

class ModulDrawerItem extends StatefulWidget {
  ModulDrawerItem({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ModulDrawerItemState createState() => _ModulDrawerItemState();
}

class _ModulDrawerItemState extends State<ModulDrawerItem>
    with TickerProviderStateMixin {
  HiddenDrawerController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = HiddenDrawerController(
      // initial page tuk opening jadi misal user ke modul buka ini am pertameny t
      initialPage: MainPage(
        title: 'main',
      ),
      // ini dikasi map jak bs mah kali ye.. jadi kau ngurus ini jam
      items: [
        DrawerItem(
          //Judul Modul
          text: Text(
            'Introduction',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(color: Colors.black),
          ),
          //Icon kondisi isComplete ? Icon(Icons.done) : Icon(Icons.play)
          icon: Icon(Icons.done, color: Colors.green),
          //PAGE untuk navigator ke UI baru
          page: MainPage(
            title: 'Introduction',
          ),
        ),
        DrawerItem(
          text: Text(
            'Build Calculator Apps lakad matataaanng',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(color: Colors.black, fontSize: 14.0),
          ),
          icon: Icon(Icons.play_arrow, color: Colors.green),
          page: MainPage(
            title: 'Build Calculator Apps',
          ),
        ),
        DrawerItem(
          text: Text(
            'Build Calculator Apps lakad matataaanng',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(color: Colors.black, fontSize: 14.0),
          ),
          icon: Icon(Icons.play_arrow, color: Colors.green),
          page: MainPage(
            title: 'Build Calculator Apps',
          ),
        ),
        DrawerItem(
          text: Text(
            'Build Calculator Apps lakad matataaanng',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(color: Colors.black, fontSize: 14.0),
          ),
          icon: Icon(Icons.play_arrow, color: Colors.green),
          page: MainPage(
            title: 'Build Calculator Apps',
          ),
        ),
        DrawerItem(
          text: Text(
            'Build Calculator Apps lakad matataaanng',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(color: Colors.black, fontSize: 14.0),
          ),
          icon: Icon(Icons.play_arrow, color: Colors.green),
          page: MainPage(
            title: 'Build Calculator Apps',
          ),
        ),
        DrawerItem(
          text: Text(
            'Build Calculator Apps lakad matataaanng',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(color: Colors.black, fontSize: 14.0),
          ),
          icon: Icon(Icons.play_arrow, color: Colors.green),
          page: MainPage(
            title: 'Build Calculator Apps',
          ),
        ),
        DrawerItem(
          text: Text(
            'Build Calculator Apps lakad matataaanng',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(color: Colors.black, fontSize: 14.0),
          ),
          icon: Icon(Icons.play_arrow, color: Colors.green),
          page: MainPage(
            title: 'Build Calculator Apps',
          ),
        ),
        DrawerItem(
          text: Text(
            'Build Calculator Apps lakad matataaanng',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(color: Colors.black, fontSize: 14.0),
          ),
          icon: Icon(Icons.play_arrow, color: Colors.green),
          page: MainPage(
            title: 'Build Calculator Apps',
          ),
        ),
        DrawerItem(
          text: Text(
            'Build Calculator Apps lakad matataaanng',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(color: Colors.black, fontSize: 14.0),
          ),
          icon: Icon(Icons.play_arrow, color: Colors.green),
          page: MainPage(
            title: 'Build Calculator Apps',
          ),
        ),
      ],
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
