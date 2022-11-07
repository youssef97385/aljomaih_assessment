import 'package:aljomaih_assessment/src/core/common/domain/entites/order_entity.dart';
import 'package:aljomaih_assessment/src/features/orders_list/domain/repository/orders_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/common/data/models/error_model/error_model.dart';


class GetOrders{
  final OrdersRepository repository;

  GetOrders({required this.repository,});

  @override
  Future<Either<ErrorModel, List<OrderEntity>>> call(

      ) async {
    return repository.getOrders(

    );
  }
}


