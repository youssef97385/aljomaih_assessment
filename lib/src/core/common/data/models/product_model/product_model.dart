import 'package:aljomaih_assessment/src/core/common/domain/entites/product_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends Equatable {
  final String? id;
  final String? name;
  final String? avatar;
  final int? count;

  const ProductModel({
    this.id,
    this.name,
    this.avatar,
    this.count,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return _$ProductModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);


  ProductEntity toProductEntity(){
    return ProductEntity(
      id: id,
      name: name,
      avatar: avatar,
      count: count,

    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    avatar,
    count,
  ];
}
