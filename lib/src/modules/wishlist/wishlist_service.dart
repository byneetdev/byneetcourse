import 'package:byneetcourseapp/src/kutils/api.dart';
import 'package:byneetcourseapp/src/modules/course/models/course_model_purin.dart';
import 'package:flutter/material.dart';

class WishListService with ChangeNotifier {
  final String idUser;
  Api _api;
  WishListService(this.idUser) {
    _api = Api('users/$idUser/wishlist');
  }

  //tempat simpan data
  List<CourseModel> wishlist;

  Future<List<CourseModel>> getDataCollection() async {
    var res = await _api.getDataCollection();
    if (res.documents.length > 1) {
      wishlist =
          res.documents.map((doc) => CourseModel.fromFirestore(doc)).toList();
      return wishlist;
    }
    return null;
  }

  Future<void> addWishlist(String id, CourseModel data) async {
    await _api.setDocument(id, data.toMap());
  }
}
