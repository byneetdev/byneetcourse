import 'package:byneetcourseapp/src/kutils/api.dart';
import 'package:flutter/material.dart';

import 'models/wishlist_model_purin.dart';

class WishListService with ChangeNotifier {
  final String idUser;
  var _api;
  WishListService(this.idUser) {
    _api = Api('users/$idUser/wishlist');
  }

  //tempat simpan data
  List<WishListModel> wishlist;
  WishListModel wishDetail;

  //nambah documnt
  Future addDocument(Map data) async {
    await _api.addDocument(data);
    return;
  }

  Future<List<WishListModel>> getDataCollection() async {
    var res = await _api.getDataCollection();
    wishlist =
        res.documents.map((doc) => WishListModel.fromFirestore(doc)).toList();
    return wishlist;
  }

  Future<WishListModel> getDocumentById(String id) async {
    var doc = await _api.getDocumentById(id);
    wishDetail = WishListModel.fromFirestore(doc);
    return wishDetail;
  }

  Future removeDocument(String id) async {
    await _api.removeDocument(id);
    return;
  }

  Future updateDocument(String id, Map data) async {
    await _api.updateDocument(id, data);
    return;
  }
}
