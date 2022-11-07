// To parse this JSON data, do
//
//     final ordersResponseModel = ordersResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:aljomaih_assessment/src/core/common/data/models/client_model/client_model.dart';
import 'package:aljomaih_assessment/src/core/common/data/models/product_model/product_model.dart';

List<OrdersResponseModel> ordersResponseModelFromJson(String str) => List<OrdersResponseModel>.from(json.decode(str).map((x) => OrdersResponseModel.fromJson(x)));

class OrdersResponseModel {
  OrdersResponseModel({
    this.ammount,
    this.date,
    this.userId,
    this.client,

    this.id,
  });

  int? ammount;
  String? date;
  String? userId;
  ClientModel? client;

  String? id;

  factory OrdersResponseModel.fromJson(Map<String, dynamic> json) => OrdersResponseModel(
    ammount: json["ammount"],
    date: json["date"],
    userId: json["user_id"],
    client: ClientModel.fromJson(json["client"]),

    id: json["id"],
  );


}


