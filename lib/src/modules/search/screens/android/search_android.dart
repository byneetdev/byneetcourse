import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';

class SearchAndroid extends StatelessWidget {
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
                //nama page / appbar title
                title: ClayContainer(
                  borderRadius: 15,
                  emboss: true,
                  width: 80,
                  depth: 20,
                  color: Color(0xFFD2E0EF),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("Search",
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
          margin: EdgeInsets.symmetric(horizontal: 17.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20.0),
                //kotak pencarian
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClayContainer(
                    borderRadius: 15,
                    emboss: true,
                    color: Color(0xFFD2E0EF),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Cari Kelas...",
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                              icon: Icon(Icons.search), onPressed: () {}),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 35.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClayContainer(
                    borderRadius: 16.0,
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    color: Color(0xFFD2E0EF),
                    child: Container(
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: AssetImage("images/talent_search.png"),
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClayContainer(
                    emboss: true,
                    borderRadius: 16.0,
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xFFD2E0EF),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Temukan kelas menarik, ayo jelajahi dunia dengan ilmu pengetahuan",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
