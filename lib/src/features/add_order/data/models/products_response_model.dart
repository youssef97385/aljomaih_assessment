

import 'dart:convert';

List<ProductsResponseModel> productsResponseModelFromJson(String str) => List<ProductsResponseModel>.from(json.decode(str).map((x) => ProductsResponseModel.fromJson(x)));

String productsResponseModelToJson(List<ProductsResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsResponseModel {
  ProductsResponseModel({
    this.name,
    this.avatar,
    this.count,
    this.id,
  });

  String? name;
  String? avatar;
  int? count;
  String? id;

  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) => ProductsResponseModel(
    name: json["name"],
    avatar: json["avatar"],
    count: json["count"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "avatar": avatar,
    "count": count,
    "id": id,
  };
}
