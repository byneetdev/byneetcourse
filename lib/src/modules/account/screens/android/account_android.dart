import 'package:byneetcourseapp/src/modules/account/widgets/account_widget.dart';
import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:flutter/material.dart';

class AccountAndroid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerScroll) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 400.0,
              floating: false,
              // pinned: true,
              elevation: 0,
              backgroundColor: Color(0xFFD2E0EF),
              flexibleSpace: FlexibleSpaceBar(
                // centerTitle: true,
                background: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 60,
                      left: 40,
                      right: 40,
                      child: Column(
                        children: <Widget>[
                          ClayContainer(
                            width: 150,
                            height: 150,
                            borderRadius: 150,
                            color: Color(0xFFD2E0EF),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.amber,
                                backgroundImage:
                                    AssetImage("images/byneet3.png"),
                              ),
                            ),
                          ),
                          SizedBox(height: 25),
                          ClayContainer(
                            emboss: true,
                            borderRadius: 16,
                            color: Color(0xFFD2E0EF),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "Byneet Dev, Ph.D",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 35),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ClayContainer(
                                color: Color(0xFFD2E0EF),
                                borderRadius: 15,
                                width: 100,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "231",
                                        style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "Total Kelas",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 40),
                              ClayContainer(
                                color: Color(0xFFD2E0EF),
                                borderRadius: 15,
                                width: 100,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "10",
                                        style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "Kelas Selesai",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ];
        },
        body: Container(
          margin: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                AccountWidget(
                  icon: Icon(Icons.android),
                  title: "Android",
                ),
                AccountWidget(
                  icon: Icon(Icons.settings_applications),
                  title: "Pengaturan",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
