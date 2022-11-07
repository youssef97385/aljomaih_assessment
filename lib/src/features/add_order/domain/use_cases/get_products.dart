import 'package:aljomaih_assessment/src/core/common/domain/entites/client_entity.dart';
import 'package:aljomaih_assessment/src/core/common/domain/entites/order_entity.dart';
import 'package:aljomaih_assessment/src/core/common/domain/entites/product_entity.dart';
import 'package:aljomaih_assessment/src/features/add_order/domain/repository/clients_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/common/data/models/error_model/error_model.dart';

class GetProducts {
  final AddProductsRepository repository;

  GetProducts({
    required this.repository,
  });

  @override
  Future<Either<ErrorModel, List<ProductEntity>>> call() async {
    return repository.getProducts();
  }
}
