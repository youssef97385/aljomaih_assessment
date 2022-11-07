import 'package:aljomaih_assessment/src/core/common/domain/entites/order_entity.dart';
import 'package:aljomaih_assessment/src/features/orders_list/data/data_source/remote_data_source/orders_remote_data_source.dart';
import 'package:aljomaih_assessment/src/features/orders_list/data/mappers/order_mapper.dart';
import 'package:aljomaih_assessment/src/features/orders_list/data/models/orders_response_model.dart';
import 'package:aljomaih_assessment/src/features/orders_list/domain/repository/orders_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/common/data/models/error_model/error_model.dart';
import '../../../../core/utils/helpers/error_parser.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  final OrdersRemoteDataSource dataSource;

  OrdersRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<ErrorModel, List<OrderEntity>>> getOrders() async {
    try {
      List<OrdersResponseModel> result = await dataSource.getOrders();

      final OrderMapper orderMapper = OrderMapper(ordersList: result);

      List<OrderEntity> ordersEntityList = orderMapper.toListOrdersEntity();


      return Right(ordersEntityList);
    } on DioError catch (error, stackTrace) {
      return Left(errorParse(error, stackTrace));
    }
    catch(e){

      print("er## $e");
      return Left(ErrorModel(error: Error(message: "some thing wrong")));
    }
  }
}
