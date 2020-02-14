import 'package:cloud_firestore/cloud_firestore.dart';

//nanti tinggal atur model nye jak..
class AccountModel {
  final String id;
  final String urlImg;
  final String nama;
  AccountModel({this.urlImg, this.id, this.nama});

  factory AccountModel.fromFirestore(DocumentSnapshot doc) => AccountModel(
      id: doc.documentID, urlImg: doc.data["urlImg"], nama: doc.data["nama"]);

  Map<String, dynamic> toMap() {
    return {};
  }
}
