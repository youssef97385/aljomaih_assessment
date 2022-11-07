import 'package:aljomaih_assessment/src/core/common/data/models/order_model/order_model.dart';
import 'package:aljomaih_assessment/src/core/common/domain/entites/client_entity.dart';
import 'package:aljomaih_assessment/src/core/common/domain/entites/order_entity.dart';
import 'package:aljomaih_assessment/src/features/add_order/domain/repository/clients_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/common/data/models/error_model/error_model.dart';
import '../../../../core/common/data/models/success_model/success_model.dart';

class AddOrder {
  final AddProductsRepository repository;

  AddOrder({
    required this.repository,
  });

  @override
  Future<Either<ErrorModel, SuccessModel>> call(OrderModel orderModel) async {
    return repository.addOrder(orderModel);
  }
}
