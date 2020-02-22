import 'package:byneetcourseapp/src/modules/course/models/theory_model.dart';
import 'package:flutter/material.dart';

import '../../kutils/api.dart';
import '../course/models/materi_model.dart';

class MateriService with ChangeNotifier {
  final String idCourse;
  Api _api;
  Api _courseref = new Api("courses");
  MateriService(this.idCourse) {
    _api = Api('courses/$idCourse/materis');
  }

  //tempat simpan data
  List<MateriModel> listMateri;
  MateriModel materiDetail;

  Future<void> addDocumentAndUpdateToTheories(
      MateriModel data, List<Theory> theories) async {
    await _api.addDocument(data.toMap()).then(
        (doc) => _courseref.updateDocument(idCourse, {"theories": theories}));
    return;
  }

  //get all materi, dak gune,.. tuk admin jak nanti
  Future<List<MateriModel>> getDataCollection() async {
    var res = await _api.getDataCollection();
    listMateri =
        res.documents.map((doc) => MateriModel.fromFirestore(doc)).toList();
    return listMateri;
  }

  //get satu materi
  Future<MateriModel> getDocumentbyId(String id) async {
    var doc = await _api.getDocumentById(id);
    materiDetail = MateriModel.fromFirestore(doc);
    return materiDetail;
  }
}
