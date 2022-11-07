
import 'dart:convert';

List<ClientsResponseModel> clientsResponseModelFromJson(String str) => List<ClientsResponseModel>.from(json.decode(str).map((x) => ClientsResponseModel.fromJson(x)));

String clientsResponseModelToJson(List<ClientsResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClientsResponseModel {
  ClientsResponseModel({
    this.name,
    this.phone,
    this.address,
    this.id,
  });

  String? name;
  String? phone;
  String? address;
  String? id;

  factory ClientsResponseModel.fromJson(Map<String, dynamic> json) => ClientsResponseModel(
    name: json["name"],
    phone: json["phone"],
    address: json["address"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
    "address": address,
    "id": id,
  };
}
