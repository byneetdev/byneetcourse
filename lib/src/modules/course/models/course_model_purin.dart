import 'package:byneetcourseapp/src/modules/course/models/theory_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CourseModel {
  final String uid; // id kelas
  final String title; // judul kelas
  final String urlimage; // url gambar kelas
  final String description;
  final List<Theory> theories; // list data teori
  final String classStatus; // status kelas premium atau gratis
  final String creatorName; // nama creator == yang buat kelas == pemateri
  final int rating; // rating kelas
  final String date; // tanggal dibuat kelas
  final List<String> screenshots; // list gambar screenshot
  final List<String> progress; //list idmateri yg udah
  final int
      totalmateri; //total materi tuk ngitung perenan progress, biar dak perlu get get list materi agik

  CourseModel(
      {this.title,
      this.urlimage,
      this.description,
      this.theories,
      this.uid,
      this.classStatus,
      this.creatorName,
      this.date,
      this.rating,
      this.screenshots,
      this.progress,
      this.totalmateri});

  factory CourseModel.fromFirestore(DocumentSnapshot doc) => CourseModel(
      uid: doc.documentID,
      title: doc.data["name"],
      urlimage: doc.data["urlimage"],
      description: doc.data["description"],
      classStatus: doc.data["status"],
      creatorName: doc.data["creatorName"],
      screenshots:
          (doc.data["screenshot"] as List)?.map((e) => e.toString())?.toList(),
      theories: (doc.data["theories"] as List)
          ?.map((e) => Theory.fromMap(e))
          ?.toList(),
      progress:
          (doc.data["progress"] as List)?.map((e) => e.toString())?.toList(),
      totalmateri: doc.data['totalmateri']);

  Map<String, dynamic> toMap() {
    return {
      "name": title,
      "urlimage": urlimage,
      "description": description,
      "screenshot": screenshots,
      "status": classStatus,
      "creatorName": creatorName,
      "theories": theories.map((e) => e.toMap())?.toList(),
      "progress": progress,
      "totalmateri": totalmateri
    };
  }
}
