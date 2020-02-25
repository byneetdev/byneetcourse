import 'package:byneetcourseapp/src/modules/course/models/course_model_purin.dart';
import 'package:byneetcourseapp/src/modules/loading_container.dart';
import 'package:byneetcourseapp/src/modules/login/services/login_service.dart';
import 'package:byneetcourseapp/src/modules/nodata_container.dart';
import 'package:byneetcourseapp/src/modules/wishlist/widgets/wishlist_widget.dart';
import 'package:byneetcourseapp/src/modules/wishlist/wishlist_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistAndroid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LoginService>(context);
    final wishlist = Provider.of<WishListRepository>(context);
    print(wishlist.wishlist);
    return FutureBuilder<List<CourseModel>>(
        future: wishlist.getState(user.user.uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done)
            return LoadingContainer();
          if (!snapshot.hasData) return NoDataContainer();
          return Container(
            margin: EdgeInsets.only(top: 45.0),
            child: WishListWidget(
              kelas: snapshot.data,
            ),
          );
        });
  }
}
