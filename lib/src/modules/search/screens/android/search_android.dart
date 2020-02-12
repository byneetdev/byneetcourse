import 'package:byneetcourseapp/src/modules/search/widgets/categories_widget.dart';
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
                SizedBox(height: 50.0),
                Text(
                  "Cari berdasarkan kategori",
                  style: TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15.0),
                //Kategori item Widget
                CategoriesWidget(
                  categoriesTitle: "Web Designer",
                  onTap: () {
                    print("Web Designer");
                  },
                  urlimage: "images/gambar1.jpg",
                ),
                CategoriesWidget(
                  categoriesTitle: "Android Developer",
                  onTap: () {
                    print("Android Developer");
                  },
                  urlimage: "images/gambar1.jpg",
                ),
                CategoriesWidget(
                  categoriesTitle: "Web Developer",
                  onTap: () {
                    print("Web Developer");
                  },
                  urlimage: "images/gambar1.jpg",
                ),
                CategoriesWidget(
                  categoriesTitle: "Data Analyst",
                  onTap: () {
                    print("Data Analyst");
                  },
                  urlimage: "images/gambar1.jpg",
                ),
                CategoriesWidget(
                  categoriesTitle: "Technical Network System",
                  onTap: () {
                    print("Technical Network System");
                  },
                  urlimage: "images/gambar1.jpg",
                ),
                SizedBox(height: 100)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
