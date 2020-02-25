import 'package:cloud_firestore/cloud_firestore.dart';

class WishListModel {
  final String data;
  WishListModel({this.data});

  factory WishListModel.fromFirestore(DocumentSnapshot doc) =>
      WishListModel(data: doc.toString());

  Map<String, dynamic> toMap() {
    return {};
  }
}
