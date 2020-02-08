import 'package:cloud_firestore/cloud_firestore.dart';

class CourseModel {
  final String data;
  CourseModel({this.data});

  factory CourseModel.fromFirestore(DocumentSnapshot doc) =>
      CourseModel(data: doc.toString());

  Map<String, dynamic> toMap() {
    return {};
  }
}
