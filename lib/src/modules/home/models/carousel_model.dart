import 'package:cloud_firestore/cloud_firestore.dart';

class CarouselModel {
  final String id;
  final String name;
  final String status;
  final String urlimage;
  CarouselModel({this.name, this.status, this.urlimage, this.id});

  factory CarouselModel.fromFirestore(DocumentSnapshot doc) => CarouselModel(
      id: doc.documentID,
      name: doc.data["name"],
      status: doc.data["status"],
      urlimage: doc.data["urlimage"]);

  Map<String, dynamic> toMap() {
    return {};
  }
}
