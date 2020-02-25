class Theory {
  final String id;
  final String title;
  final List<ItemModel> items;
  Theory({this.title, this.id, this.items});

  factory Theory.fromMap(Map doc) {
    return Theory(
      title: doc["title"],
      items: (doc["items"] as List).map((e) => ItemModel.fromMap(e)).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "items": items.map((e) => e.toMap()).toList(),
    };
  }
}

class ItemModel {
  final String title;
  final String idmateri;
  final bool isdone;

  ItemModel({this.title, this.idmateri, this.isdone});

  factory ItemModel.fromMap(Map data) {
    return ItemModel(
      title: data["title"],
      idmateri: data['idmateri'],
      isdone: data["isdone"] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "idmateri": idmateri,
    };
  }
}
