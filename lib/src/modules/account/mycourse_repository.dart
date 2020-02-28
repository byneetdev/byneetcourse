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

  Future<List<CourseModel>> getData(String uid) async {
    var res = await MycourseService(uid).getCollection();
    _listMycourse = res;
    notifyListeners();
    return _listMycourse;
  }

  Future<List<CourseModel>> getState(String uid) async {
    if (_listMycourse == null) {
      var res = await MycourseService(uid).getCollection();
      _listMycourse = res;
    }
    return listMycourse;
  }

  Future<bool> getOneData(String uid, String idCourse) async {
    var res = await MycourseService(uid).getDocument(idCourse);
    myCourse = res;
    _listMycourse[_listMycourse
        .indexOf(_listMycourse.singleWhere((e) => e.uid == idCourse))] = res;
    notifyListeners();
    return true;
  }

  Future<void> updateProgressDone(
      String idUser, String idCourse, String idmateri, int totalMateri) async {
    var cekDone = _myCourse.progress
        ?.singleWhere((element) => element == idmateri, orElse: () => null);
    List<String> listData = _myCourse.progress ?? [];
    if (_myCourse.totalmateri == null || _myCourse.totalmateri != totalMateri) {
      await MycourseService(idUser).updateTotalMateri(idCourse, totalMateri);
    }
    if (cekDone == null) {
      //ngecek dah done e belom materinye, mun belum, update ke db, dah itu perbarui data nye
      // listData.remove(cekDone);
      listData.add(idmateri);
      await MycourseService(idUser)
          .updateProgressDone(idCourse, listData)
          //setelah update data, di get tuk perbarui data di mycourse;
          .then((_) async => await getOneData(idUser, idCourse));
    }
  }

  bool isDone(String idmateri) {
    bool res = _myCourse?.progress?.contains(idmateri) ?? false;
    return res;
  }
}
