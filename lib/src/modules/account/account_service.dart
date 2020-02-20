import 'package:byneetcourseapp/src/kutils/api.dart';
import 'package:byneetcourseapp/src/modules/account/models/account_model_purin.dart';
import 'package:flutter/cupertino.dart';

class AccountService with ChangeNotifier {
  final _api = Api('users');
  //langsung masukkan path collection nye. jadi ini ngambik collection('user')

  List<AccountModel> _listAccount;
  AccountModel _accountDetail;

  List<AccountModel> get listAccount => _listAccount;
  AccountModel get accountDetail => _accountDetail;

  //nambah documnt
  Future addDocument(Map data) async {
    await _api.addDocument(data);
    return;
  }

  Future setDocument(String id, Map<String, dynamic> data) async {
    await _api.setDocument(id, data);
    return;
  }

  Future<List<AccountModel>> getDataCollection() async {
    var res = await _api.getDataCollection();
    _listAccount =
        res.documents.map((doc) => AccountModel.fromFirestore(doc)).toList();
    return listAccount;
  }

  Future<AccountModel> getDocumentById(String id) async {
    var doc = await _api.getDocumentById(id);
    if (!doc.exists) return null;
    _accountDetail = AccountModel.fromFirestore(doc);
    return accountDetail;
  }

  Future removeDocument(String id) async {
    await _api.removeDocument(id);
    return;
  }

  Future updateDocument(String id, Map data) async {
    await _api.updateDocument(id, data);
    return;
  }

  //cek data user dengan uid, mun dak ade, buat data baru, mun ade= return datanye.
  Future<AccountModel> cekDataUser(String id, Map data) async {
    var cek = await getDocumentById(id);
    if (cek == null) {
      var setNewUserThenData =
          await setDocument(id, data).then((value) => getDocumentById(id));
      return setNewUserThenData;
    } else {
      return cek;
    }
  }
}
