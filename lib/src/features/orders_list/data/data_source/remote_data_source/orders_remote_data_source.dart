import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../../core/utils/managers/http/http_manager.dart';
import '../../../../../core/utils/managers/http/http_methods.dart';
import '../../models/orders_response_model.dart';

abstract class OrdersRemoteDataSource {
  Future<List<OrdersResponseModel>> getOrders();
}

class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  final HttpManager httpManager;

  OrdersRemoteDataSourceImpl({
    required this.httpManager,
  });
  @override
  Future<List<OrdersResponseModel>> getOrders() async {
    final Response response = await httpManager.request(
      path: "/api/v1/orders",
      method: HttpMethods.Get,

    );


    return ordersResponseModelFromJson(response.toString());
  }
}
