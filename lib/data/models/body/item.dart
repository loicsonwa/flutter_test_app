import 'dart:convert';

// ItemModel itemFromJson(String str) => ItemModel.fromJson(json.decode(str));
//
// String itemToJson(ItemModel data) => json.encode(data.toJson());

List<ItemModel> itemFromJson(Map<String, dynamic> json) => List<ItemModel>.from(json[""].map((x) => ItemModel.fromJson(x)));
String itemToJson(List<ItemModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemModel {
  ItemModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
  };
}

class Item {
  Item({
    required this.data,
  });

  List<ItemModel> data;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    data: List<ItemModel>.from(json["data"].map((x) => ItemModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}