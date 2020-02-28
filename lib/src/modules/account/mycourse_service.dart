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
  CourseModel myCourse;

  Future<List<CourseModel>> getCollection() async {
    var res = await _api.getDataCollection();
    if (res.documents.length > 0) {
      listMyCourse =
          res.documents.map((doc) => CourseModel.fromFirestore(doc)).toList();
      return listMyCourse;
    }
    return null;
  }

  Future<CourseModel> getDocument(String idCourse) async {
    var doc = await _api.getDocumentById(idCourse);
    myCourse = CourseModel.fromFirestore(doc);
    return myCourse;
  }

  //ngeset document di collection user/$iduser/mysourse, triger pas user daftar course
  Future<void> setDocument(CourseModel data) async {
    await _api.setDocument(data.uid, data.toMap());
  }

  //nyimpan progress berdasarkan idmateri,..
  Future<void> updateProgressDone(String idmycourse, List<String> data) async {
    await _api.updateDocument(idmycourse, {"progress": data});
  }

  //nyimpan total materi tuk di progress
  Future<void> updateTotalMateri(String idcourse, int totalMateri) async {
    await _api.updateDocument(idcourse, {"totalmateri": totalMateri});
  }
}
