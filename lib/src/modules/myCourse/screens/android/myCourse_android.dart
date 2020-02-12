import 'package:byneetcourseapp/src/modules/myCourse/widgets/kelasku_widget.dart';
import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:flutter/material.dart';

class MyCourseAndroid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 80.0,
              floating: false,
              pinned: true,
              elevation: 0,
              backgroundColor: Color(0xFFD2E0EF),
              flexibleSpace: FlexibleSpaceBar(
                // centerTitle: true,
                title: ClayContainer(
                  borderRadius: 15,
                  emboss: true,
                  width: 80,
                  depth: 20,
                  color: Color(0xFFD2E0EF),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("Kelasku",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        )),
                  ),
                ),
              ),
            )
          ];
        },
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 17.0, vertical: 10),
          child: Column(
            children: <Widget>[
              // SizedBox(height: 20),
              KelaskuWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
