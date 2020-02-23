import 'package:byneetcourseapp/src/modules/course/models/materi_model.dart';
import 'package:byneetcourseapp/src/modules/course/services/materi_service.dart';
import 'package:flutter/cupertino.dart';

class MateriRepository with ChangeNotifier {
  List<MateriModel> _listMateri;
  String _idCourse;

  List<MateriModel> get listMateri => _listMateri;
  String get idCourse => _idCourse;

  set listMateri(List<MateriModel> data) {
    _listMateri = data;
    notifyListeners();
  }

  Future<void> getData(String idCourse) async {
    var res = await MateriService(idCourse).getDataCollection();
    _listMateri = res;
    notifyListeners();
  }

  Future<List<MateriModel>> getState(String idcourse) async {
    //ngecek _lismateri kosong, atau idcourse yg mauk diambik stat
    if (_listMateri == null || _idCourse != idcourse) {
      var res = await MateriService(idcourse).getDataCollection();
      listMateri = res;
      _idCourse = idcourse;
    }
    return listMateri;
  }
}
