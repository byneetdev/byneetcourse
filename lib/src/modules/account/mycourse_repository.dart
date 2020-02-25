import 'package:byneetcourseapp/src/modules/account/mycourse_service.dart';
import 'package:byneetcourseapp/src/modules/course/models/course_model_purin.dart';
import 'package:flutter/cupertino.dart';

class MyCourseRepository with ChangeNotifier {
  List<CourseModel> _listMycourse;
  CourseModel _myCourse;

  List<CourseModel> get listMycourse => _listMycourse;
  CourseModel get myCourse => _myCourse;

  set listMycourse(List<CourseModel> data) {
    _listMycourse = data;
    notifyListeners();
  }

  set myCourse(CourseModel data) {
    _myCourse = data;
    notifyListeners();
  }

  void currentMysCourse(String idCourse) {
    myCourse = _listMycourse.singleWhere((element) => element.uid == idCourse);
  }

  Future<void> getData(String uid) async {
    var res = await MycourseService(uid).getCollection();
    _listMycourse = res;
    notifyListeners();
  }

  Future<List<CourseModel>> getState(String uid) async {
    if (_listMycourse == null) {
      var res = await MycourseService(uid).getCollection();
      _listMycourse = res;
    }
    return listMycourse;
  }

  Future<void> getOneData(String uid, String idCourse) async {
    var res = await MycourseService(uid).getDocument(idCourse);
    myCourse = res;
    notifyListeners();
  }

  Future<void> updateProgressDone(
      String idUser, String idCourse, String idmateri) async {
    var cekDone = _myCourse.progress
        ?.singleWhere((element) => element == idmateri, orElse: () => null);
    List<String> listData = _myCourse.progress ?? [];
    if (cekDone != null) {
      //cek materi udah done atau belum, mun udah di remove lok dari list, baru di add agik,
      //jadi materi terakhir yg di klik, masuk ke last array, dan biar dak terjadi duplikat array.
      listData.remove(cekDone);
    }
    listData.add(idmateri);
    await MycourseService(idUser)
        .updateProgressDone(idCourse, listData)
        .then((_) async => await getOneData(idUser, idCourse));
  }

  bool isDone(String idmateri) {
    bool res = _myCourse?.progress?.contains(idmateri) ?? false;
    return res;
  }
}
