import 'package:byneetcourseapp/src/utils/api.dart';
import 'package:byneetcourseapp/src/modules/course/models/course_model_purin.dart';

class WishListService {
  final String idUser;
  Api _api;
  WishListService(this.idUser) {
    _api = Api('users/$idUser/wishlist');
  }

  Future<List<CourseModel>> getDataCollection() async {
    var res = await _api.getDataCollection();
    if (res.documents.length > 0) {
      List<CourseModel> wishlist =
          res.documents.map((doc) => CourseModel.fromFirestore(doc)).toList();
      print('get wishlist collection' + wishlist.length.toString());
      return wishlist;
    }
    return null;
  }

  Future<void> setWishlist(CourseModel data, bool isInList) async {
    if (isInList) {
      await _api.removeDocument(data.uid);
    } else {
      await _api.setDocument(data.uid, data.toMap());
    }
  }
}
