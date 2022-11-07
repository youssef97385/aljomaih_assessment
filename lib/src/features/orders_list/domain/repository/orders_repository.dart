import 'package:aljomaih_assessment/src/core/common/domain/entites/order_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/common/data/models/error_model/error_model.dart';

abstract class OrdersRepository {
  Future<Either<ErrorModel, List<OrderEntity>>> getOrders();
}
