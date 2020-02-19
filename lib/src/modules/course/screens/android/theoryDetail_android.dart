import 'package:byneetcourseapp/src/modules/course/widgets/subTheory.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';

class TheoryDetailAndroid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClayContainer(
              color: Color(0xFFD2E0EF),
              width: 35,
              height: 35,
              borderRadius: 35,
              child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ),
          title: ClayContainer(
            emboss: true,
            borderRadius: 12,
            color: Color(0xFFD2E0EF),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("Nama teori"),
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Center(child: Text("INI THEORI YANG AKAN DI AJARKAN")),
              ],
            ),
          ),
        ),
        endDrawer: Drawer(
          child: Container(
            color: Color(0xFFD2E0EF),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ClayContainer(
                    color: Color(0xFFD2E0EF),
                    borderRadius: 12,
                    emboss: true,
                    child: DrawerHeader(
                      margin: EdgeInsets.all(15),
                      child: Column(
                        children: <Widget>[
                          Text(
                              "Flutter Cross-Platform from Beginner to Advanced",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                //widget untuk list materi di drawer
                //untuk widget ini nampilkan semue materi.
                SubTheoryWidget(
                  title: "Introducting", // judul
                  isComplete:
                      true, // kondisi. kalo selesai icon done, kalo belom icon play
                  onTap: () {
                    print("intro");
                  },
                ),
                SubTheoryWidget(
                  title: "Everything is widget",
                  isComplete: true,
                  onTap: () {},
                ),
                SubTheoryWidget(
                  title: "Navigator Flutter",
                  isComplete: true,
                  onTap: () {},
                ),
                SubTheoryWidget(
                  title: "Make BMO App from Scarch",
                  isComplete: false,
                  onTap: () {},
                ),
                SubTheoryWidget(
                  title: "Calculator app",
                  isComplete: false,
                  onTap: () {},
                ),
                Divider(color: Color(0xFF83867C)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
