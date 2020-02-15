import 'package:cloud_firestore/cloud_firestore.dart';

class CourseModel {
  final String id;
  final String name;
  final String urlimage;
  final String status;
  final String description;
  final List<String> screenshot;
  CourseModel(
      {this.name,
      this.urlimage,
      this.status,
      this.description,
      this.screenshot,
      this.id});

  factory CourseModel.fromFirestore(DocumentSnapshot doc) => CourseModel(
        id: doc.documentID,
        name: doc.data["name"],
        urlimage: doc.data["urlimage"],
        status: doc.data["status"],
        description: doc.data["description"],
        screenshot:
            (doc.data["screenshot"] as List).map((e) => e.toString()).toList(),
      );

  Map<String, dynamic> toMap() {
    return {};
  }
}
