import 'package:byneetcourseapp/src/kutils/api.dart';
import 'package:flutter/material.dart';

import 'models/materi_model.dart';

class MateriService with ChangeNotifier {
  final String idCourse;
  Api _api;
  MateriService(this.idCourse) {
    _api = Api('courses/$idCourse/materis');
  }

  //tempat simpan data
  List<MateriModel> listMateri;
  MateriModel materiDetail;

  Future addDocument(Map data) async {
    await _api.addDocument(data);
    return;
  }

  Future<List<MateriModel>> getDataCollection() async {
    var res = await _api.getDataCollection();
    listMateri =
        res.documents.map((doc) => MateriModel.fromFirestore(doc)).toList();
    return listMateri;
  }

  Future<MateriModel> getDocumentbyId(String id) async {
    var doc = await _api.getDocumentById(id);
    materiDetail = MateriModel.fromFirestore(doc);
    return materiDetail;
  }
}
