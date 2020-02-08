import 'package:byneetcourseapp/src/kutils/api.dart';
import 'package:flutter/material.dart';

import 'models/course_model_purin.dart';

class MateriService with ChangeNotifier {
  final String idCourse;
  var _api;
  MateriService(this.idCourse) {
    _api = Api('courses/$idCourse/materis');
  }

  //tempat simpan data
  List<CourseModel> listAccount;
  CourseModel accountDetail;

  Future addDocument(Map data) async {
    await _api.addDocument(data);
    return;
  }

  Future<List<CourseModel>> getDataCollection() async {
    var res = await _api.getDataCollection();
    listAccount =
        res.documents.map((doc) => CourseModel.fromFirestore(doc)).toList();
    return listAccount;
  }

  Future<CourseModel> getDocumentById(String id) async {
    var doc = await _api.getDocumentById(id);
    accountDetail = CourseModel.fromFirestore(doc);
    return accountDetail;
  }

  Future removeDocument(String id) async {
    await _api.removeDocument(id);
    return;
  }

  Future updateDocument(String id, Map data) async {
    await _api.updateDocument(id, data);
    return;
  }
}
