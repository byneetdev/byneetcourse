import 'package:byneetcourseapp/src/utils/api.dart';
import 'package:byneetcourseapp/src/modules/course/models/course_model_purin.dart';
import 'package:flutter/cupertino.dart';

class SearchService with ChangeNotifier {
  final _api = Api('courses');

  List<CourseModel> listCourse;

  Future<List<CourseModel>> searchCourse(String keySearch) async {
    var res = await _api.ref
        .where('keyword', arrayContains: keySearch)
        .getDocuments();
    listCourse =
        res.documents.map((doc) => CourseModel.fromFirestore(doc)).toList();
    return listCourse;
  }
}
