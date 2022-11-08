import 'package:aljomaih_assessment/src/core/common/domain/entites/order_entity.dart';
import 'package:aljomaih_assessment/src/core/constants/const.dart';
import 'package:aljomaih_assessment/src/features/orders_list/data/data_source/remote_data_source/orders_remote_data_source.dart';
import 'package:aljomaih_assessment/src/features/orders_list/data/mappers/order_mapper.dart';
import 'package:aljomaih_assessment/src/features/orders_list/data/models/orders_response_model.dart';
import 'package:aljomaih_assessment/src/features/orders_list/domain/repository/orders_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/common/data/models/error_model/error_model.dart';
import '../../../../core/utils/helpers/error_parser.dart';
import '../../../../core/utils/managers/http/check_endpoint_reachability.dart';
import '../../../../core/utils/managers/http/domain_lookup.dart';
import '../../../../core/utils/managers/sql_database_manager/db_services.dart';
import '../../../../injection.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  final OrdersRemoteDataSource dataSource;
  final DBService dbServices;
  final DomainLookup domainLookup;

  OrdersRepositoryImpl({
    required this.dataSource,
    required this.dbServices,
    required this.domainLookup,
  });

  @override
  Future<Either<ErrorModel, List<OrderEntity>>> getOrders() async {
    try {
      List<OrdersResponseModel> result;
      /************* Check internet *************/
      final ReachabilityStatus googleReachabilityStatus =
          await serviceLocator<CheckEndpointReachability>()
              .check(kGoogleCheckEndpoint);

      final bool isInternetAvailable =
          googleReachabilityStatus == ReachabilityStatus.reachable;

      print("isInternet available ${isInternetAvailable}");
      if (isInternetAvailable) {
        try {
          result = await dataSource.getOrders();
          await dbServices.insertOrders(result);

        } on DioError catch (error, stackTrace) {
          return Left(errorParse(error, stackTrace));
        }
      } else {
        result = await dbServices.getOrders();
      }
      final OrderMapper orderMapper = OrderMapper(ordersList: result);

      List<OrderEntity> ordersEntityList = orderMapper.toListOrdersEntity();

      return Right(ordersEntityList);
    } catch (e) {
      print("er## $e");
      return Left(ErrorModel(error: Error(message: "some thing wrong")));
    }
  }
}
