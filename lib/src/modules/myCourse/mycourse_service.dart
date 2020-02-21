import 'package:byneetcourseapp/src/utils/api.dart';
import 'package:byneetcourseapp/src/modules/course/models/course_model_purin.dart';
import 'package:flutter/cupertino.dart';

class MycourseService with ChangeNotifier {
  final String idUser;
  Api _api;
  MycourseService(this.idUser) {
    _api = Api('users/$idUser/mycourses');
  }

  List<CourseModel> listMyCourse;

  Future<List<CourseModel>> getCollection() async {
    var res = await _api.getDataCollection();
    if (res.documents.length > 0) {
      listMyCourse =
          res.documents.map((doc) => CourseModel.fromFirestore(doc)).toList();
      return listMyCourse;
    }
    return null;
  }

  Future<void> setDocument(CourseModel data) async {
    await _api.setDocument(data.uid, data.toMap());
  }
}
