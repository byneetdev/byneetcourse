import 'package:cloud_firestore/cloud_firestore.dart';

class MateriModel {
  final String id;
  final String title;
  final String urlvideo;
  final String txtmateri;

  MateriModel({this.id, this.title, this.urlvideo, this.txtmateri});

  factory MateriModel.fromFirestore(DocumentSnapshot doc) {
    return MateriModel(
        id: doc.documentID,
        title: doc.data["title"],
        urlvideo: doc.data["urlvideo"],
        txtmateri: doc.data["txtmateri"]);
  }
}
