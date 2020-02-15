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
}

class ItemModel {
  final String title;
  final String idmateri;

  ItemModel({this.title, this.idmateri});

  factory ItemModel.fromMap(Map data) {
    return ItemModel(title: data["title"], idmateri: data['idamateri']);
  }
}
