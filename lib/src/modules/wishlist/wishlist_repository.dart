import 'package:byneetcourseapp/src/modules/course/models/course_model_purin.dart';
import 'package:byneetcourseapp/src/modules/wishlist/wishlist_service.dart';
import 'package:flutter/cupertino.dart';

class WishListRepository with ChangeNotifier {
  List<CourseModel> _wishlist;
  CourseModel _wishlistDetil;

  List<CourseModel> get wishlist => _wishlist;
  CourseModel get wishlistDetil => _wishlistDetil;

  set wishlist(List<CourseModel> data) {
    _wishlist = data;
    notifyListeners();
  }

  set wishlistDetil(CourseModel data) {
    _wishlistDetil = data;
    notifyListeners();
  }

  Future<List<CourseModel>> getState(String idUser) async {
    if (_wishlist == null) {
      var res = await WishListService(idUser).getDataCollection();
      _wishlist = res;
    }
    return wishlist;
  }

  Future<void> refreshRepository(idUser) async {
    var res = await WishListService(idUser).getDataCollection();
    wishlist = res;
  }
}
