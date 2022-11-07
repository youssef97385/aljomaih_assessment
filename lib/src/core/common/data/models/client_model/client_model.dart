import 'package:aljomaih_assessment/src/core/common/domain/entites/client_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'client_model.g.dart';

@JsonSerializable()
class ClientModel extends Equatable {
  final String? id;
  final String? name;
  final String? phone;
  final String? address;

  const ClientModel({
    this.id,
    this.name,
    this.phone,
    this.address,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return _$ClientModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ClientModelToJson(this);


  ClientEntity toClientEntity(){
    return ClientEntity(
      id: id,
      name: name,
      address: address,
      phone: phone,

    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        phone,
        address,
      ];
}
