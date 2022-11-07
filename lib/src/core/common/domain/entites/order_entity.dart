import 'package:aljomaih_assessment/src/core/common/domain/entites/product_entity.dart';
import 'package:equatable/equatable.dart';
import '../../../../app/logic/app_settings.dart';
import '../../../../core/common/domain/entites/client_entity.dart';
import '../../../../injection.dart';

class OrderEntity extends Equatable {
  final String? id;
  final String? date;
  final String? userId;
  final int? ammount;
  final ClientEntity? client;
  final List<ProductEntity>? products;

  OrderEntity({
    this.id,
    this.date,
    this.userId,
    this.ammount,
    this.client,
    this.products,
  });

  @override
  List<Object?> get props => [
        id,
        date,
        ammount,
        userId,
        client,
        products,
      ];
}
