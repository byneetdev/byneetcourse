import 'package:cloud_firestore/cloud_firestore.dart';

//nanti tinggal atur model nye jak..
class AccountModel {
  final String id;
  final String urlimage;
  final String name;
  final String skill;
  AccountModel({this.urlimage, this.id, this.name, this.skill});

  factory AccountModel.fromFirestore(DocumentSnapshot doc) => AccountModel(
        id: doc.documentID,
        urlimage: doc.data["urlImg"],
        name: doc.data["nama"],
        skill: doc.data["keahlian"],
      );

  Map<String, dynamic> toMap() {
    return {};
  }
}
