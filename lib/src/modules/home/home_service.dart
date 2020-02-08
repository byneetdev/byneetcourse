import 'package:byneetcourseapp/src/kutils/api.dart';
import 'package:byneetcourseapp/src/modules/course/models/course_model_purin.dart';
import 'package:flutter/cupertino.dart';

class HomeService with ChangeNotifier {
  final _coursesApi = new Api('courses');
  final _carouselApi = new Api('carousel');

  List<CourseModel> mobilecourse;
}
