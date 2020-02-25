import 'package:byneetcourseapp/src/utils/api.dart';
import 'package:byneetcourseapp/src/modules/course/models/course_model_purin.dart';
import 'package:byneetcourseapp/src/modules/home/models/carousel_model.dart';
import 'package:flutter/cupertino.dart';

class HomeService with ChangeNotifier {
  final _carouselApi = new Api('carousel');
  final _courseApi = new Api('courses');

  List<CarouselModel> listcarousel;
  List<CourseModel> listRecomendedCourse;

  Future<List<CarouselModel>> getCarouselCollection() async {
    var collect = await _carouselApi.getDataCollection();
    listcarousel = collect.documents
        .map((doc) => CarouselModel.fromFirestore(doc))
        .toList();
    return listcarousel;
  }

  Future<List<CourseModel>> getRecomendedCourseCollection() async {
    var collect = await _courseApi.ref.limit(10).getDocuments();
    listRecomendedCourse = collect.documents
        .map((doc) => CourseModel.fromFirestore(doc))
        .toList()
        .toList();
    return listRecomendedCourse;
  }
}
