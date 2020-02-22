import 'package:byneetcourseapp/src/utils/api.dart';
import 'package:byneetcourseapp/src/modules/course/models/course_model_purin.dart';
import 'package:byneetcourseapp/src/modules/course/models/theory_model.dart';
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

  //ngeset document di collection user/$iduser/mysourse, triger pas user daftar course
  Future<void> setDocument(CourseModel data) async {
    await _api.setDocument(data.uid, data.toMap());
  }

  //nyimpan progress bentuk model data theory,.. jadi nanti cek nye, mun data theory di field progrss.item[]="ade", maka-> theory.item[]==done
  Future<void> setProgressDone(String idmycourse, List<Theory> data) async {
    await _api.updateDocument(
        idmycourse, {"progrsess": data.map((e) => e.toMap()).toList()});
  }
}
