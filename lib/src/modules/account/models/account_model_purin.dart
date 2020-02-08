import 'package:cloud_firestore/cloud_firestore.dart';

//nanti tinggal atur model nye jak..
class AccountModel {
  final String data;
  AccountModel({this.data});

  factory AccountModel.fromFirestore(DocumentSnapshot doc) =>
      AccountModel(data: doc.toString());

  Map<String, dynamic> toMap() {
    return {};
  }
}
