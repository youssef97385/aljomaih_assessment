import 'package:aljomaih_assessment/src/core/common/data/models/client_model/client_model.dart';
import 'package:aljomaih_assessment/src/core/common/data/models/product_model/product_model.dart';
import 'package:aljomaih_assessment/src/core/common/domain/entites/product_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entites/order_entity.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel extends Equatable {
  final String? id;
  final String? date;
  final int? ammount;
  @JsonKey(name: 'user_id')
  final String? userId;
  final List<ProductModel>? products;
  final ClientModel? clientModel;

  const OrderModel({
    this.id,
    this.date,
    this.ammount,
    this.userId,
    this.clientModel,
    this.products,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return _$OrderModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);





  @override
  List<Object?> get props => [
    id,
    date,
    ammount,
    clientModel,
    products,
    userId,
  ];
}
