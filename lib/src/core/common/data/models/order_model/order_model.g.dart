// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      id: json['id'] as String?,
      date: json['date'] as String?,
      ammount: json['ammount'] as int?,
      userId: json['user_id'] as String?,
      clientModel: json['clientModel'] == null
          ? null
          : ClientModel.fromJson(json['clientModel'] as Map<String, dynamic>),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'ammount': instance.ammount,
      'user_id': instance.userId,
      'products': instance.products,
      'clientModel': instance.clientModel,
    };
