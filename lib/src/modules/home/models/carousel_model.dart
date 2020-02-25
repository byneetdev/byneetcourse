import 'package:cloud_firestore/cloud_firestore.dart';

class CarouselModel {
  final String uid; // id carousel
  final String title; // nama kelas
  final String classStatus; // bool if true premium false gratis
  final String urlimage; //
  CarouselModel({this.uid, this.title, this.classStatus, this.urlimage});

  factory CarouselModel.fromFirestore(DocumentSnapshot doc) => CarouselModel(
      uid: doc.documentID,
      title: doc.data["name"],
      classStatus: doc.data["status"],
      urlimage: doc.data["urlimage"]);

  Map<String, dynamic> toMap() {
    return {};
  }
}
