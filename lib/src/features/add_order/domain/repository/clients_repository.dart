import 'package:aljomaih_assessment/src/core/common/data/models/success_model/success_model.dart';
import 'package:aljomaih_assessment/src/core/common/domain/entites/client_entity.dart';
import 'package:aljomaih_assessment/src/core/common/domain/entites/product_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/common/data/models/error_model/error_model.dart';
import '../../../../core/common/data/models/order_model/order_model.dart';

abstract class AddProductsRepository {
  Future<Either<ErrorModel, List<ClientEntity>>> getClients();
  Future<Either<ErrorModel, List<ProductEntity>>> getProducts();
  Future<Either<ErrorModel, SuccessModel>> addOrder(OrderModel orderModel);
}
