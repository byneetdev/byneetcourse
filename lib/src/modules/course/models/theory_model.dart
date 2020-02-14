class Theory {
  final String id;
  final String title;
  final List<MateriModels> materis;
  Theory({this.title, this.id, this.materis});

  factory Theory.fromFirestore(Map doc) {
    return Theory(
        title: doc["title"],
        materis: (doc["materis"] as List).map((e) => MateriModels.fromMap(e)));
  }
}

class MateriModels {
  final String title;
  final String idmateri;

  MateriModels({this.title, this.idmateri});

  factory MateriModels.fromMap(Map data) {
    return MateriModels(title: data["title"], idmateri: data['idamateri']);
  }
}
