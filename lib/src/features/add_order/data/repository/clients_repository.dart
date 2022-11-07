import 'package:aljomaih_assessment/src/core/common/data/models/success_model/success_model.dart';
import 'package:aljomaih_assessment/src/core/common/domain/entites/client_entity.dart';
import 'package:aljomaih_assessment/src/core/common/domain/entites/product_entity.dart';
import 'package:aljomaih_assessment/src/features/add_order/data/mappers/clients_mapper.dart';
import 'package:aljomaih_assessment/src/features/add_order/data/models/clients_response_model.dart';
import 'package:aljomaih_assessment/src/features/add_order/data/models/products_response_model.dart';
import 'package:aljomaih_assessment/src/features/add_order/domain/repository/clients_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/common/data/models/error_model/error_model.dart';
import '../../../../core/common/data/models/order_model/order_model.dart';
import '../../../../core/utils/helpers/error_parser.dart';
import '../mappers/products_mapper.dart';
import '../remote_data_source/add_orders_data_source.dart';

class AddProductsRepositoryImpl implements AddProductsRepository {
  final AddOrdersDataSource dataSource;

  AddProductsRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<ErrorModel, List<ClientEntity>>> getClients() async {
    try {
      List<ClientsResponseModel> result = await dataSource.getClients();

      final ClientsMapper clientsMapper = ClientsMapper(clientsList: result);

      List<ClientEntity> clientsEntityList =
          clientsMapper.toListClientsEntity();

      return Right(clientsEntityList);
    } on DioError catch (error, stackTrace) {
      return Left(errorParse(error, stackTrace));
    } catch (e) {
      return Left(ErrorModel(error: Error(message: "some thing wrong")));
    }
  }

  @override
  Future<Either<ErrorModel, List<ProductEntity>>> getProducts() async {
    try {
      List<ProductsResponseModel> result = await dataSource.getProducts();

      final ProductsMapper productsMapper =
          ProductsMapper(productsList: result);

      List<ProductEntity> productsListEntity =
          productsMapper.toListProductsEntity();

      return Right(productsListEntity);
    } on DioError catch (error, stackTrace) {
      return Left(errorParse(error, stackTrace));
    } catch (e) {
      return Left(ErrorModel(error: Error(message: "some thing wrong")));
    }
  }

  @override
  Future<Either<ErrorModel, SuccessModel>> addOrder(
      OrderModel orderModel) async {
    try {
      bool result = await dataSource.addOrder(orderModel);

      if (result) {
        return const Right(SuccessModel(message: 'order added successfully'));
      } else {
        return Left(ErrorModel(error: Error(message: "error in adding order")));
      }
    } on DioError catch (error, stackTrace) {
      return Left(errorParse(error, stackTrace));
    } catch (e) {
      return Left(ErrorModel(error: Error(message: "some thing wrong")));
    }
  }
}
