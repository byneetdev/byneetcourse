import 'package:byneetcourseapp/src/modules/course/models/course_model_purin.dart';
import 'package:byneetcourseapp/src/modules/login/services/login_service.dart';
import 'package:byneetcourseapp/src/modules/nodata_container.dart';
import 'package:byneetcourseapp/src/modules/wishlist/widgets/wishlist_widget.dart';
import 'package:byneetcourseapp/src/modules/wishlist/wishlist_service.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../loading_container.dart';

class WishlistAndroid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LoginService>(context);
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
                    child: Text("Wishlist",
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
        body: FutureBuilder<List<CourseModel>>(
            future: WishListService(user.user.uid).getDataCollection(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done)
                return LoadingContainer();
              if (!snapshot.hasData) return NoDataContainer();
              return Container(
                child: WishListWidget(
                  kelas: snapshot.data,
                ),
              );
            }),
      ),
    );
  }
}
