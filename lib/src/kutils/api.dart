import 'package:cloud_firestore/cloud_firestore.dart';

class Api {
  final Firestore _db = Firestore.instance;

  final String path;

  CollectionReference ref;

  //ini tuk biar pas di inisialisasikan langsung ngambik path nye, jadikan coolectionreference
  Api(this.path) {
    ref = _db.collection(path);
  }

  //get List Document (per collection)
  Future<QuerySnapshot> getDataCollection() {
    return ref.getDocuments();
  }

  //ini tuk mun mauk stream List document (collection)
  Stream<QuerySnapshot> streamDataCollection() {
    return ref.snapshots();
  }

  //get document berdasarkan id/key
  Future<DocumentSnapshot> getDocumentById(String id) {
    return ref.document(id).get();
  }

  //ngapus berdasarkan id
  Future<void> removeDocument(String id) {
    return ref.document(id).delete();
  }

  //nambah dokument dengan autogenerate key/id
  Future<DocumentReference> addDocument(Map<String, dynamic> data) {
    return ref.add(data);
  }

  //buat dokument(set) pakai id/key yg di tentukan
  Future<void> setDocument(String id, Map<String, dynamic> data) {
    return ref.document(id).setData(data);
  }

  //ngupdate dokument berdasarkan id
  Future<void> updateDocument(String id, Map<String, dynamic> data) {
    return ref.document(id).updateData(data);
  }
}
