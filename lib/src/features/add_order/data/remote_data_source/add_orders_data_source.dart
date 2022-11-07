import 'package:aljomaih_assessment/src/core/common/data/models/client_model/client_model.dart';
import 'package:aljomaih_assessment/src/core/common/data/models/order_model/order_model.dart';
import 'package:aljomaih_assessment/src/features/add_order/data/models/clients_response_model.dart';
import 'package:aljomaih_assessment/src/features/add_order/data/models/products_response_model.dart';
import 'package:dio/dio.dart';
import '../../../../core/utils/managers/http/http_manager.dart';
import '../../../../core/utils/managers/http/http_methods.dart';

abstract class AddOrdersDataSource {
  Future<List<ClientsResponseModel>> getClients();

  Future<List<ProductsResponseModel>> getProducts();

  Future<bool> addOrder(OrderModel orderModel);
}

class AddOrdersDataSourceImpl implements AddOrdersDataSource {
  final HttpManager httpManager;

  AddOrdersDataSourceImpl({
    required this.httpManager,
  });

  @override
  Future<List<ClientsResponseModel>> getClients() async {
    final Response response = await httpManager.request(
      path: "/api/v1/clients",
      method: HttpMethods.Get,
    );
    return clientsResponseModelFromJson(response.toString());
  }

  @override
  Future<List<ProductsResponseModel>> getProducts() async {
    final Response response = await httpManager.request(
      path: "/api/v1/products",
      method: HttpMethods.Get,
    );
    return productsResponseModelFromJson(response.toString());
  }

  @override
  Future<bool> addOrder(OrderModel orderModel) async {
    ClientModel clientModel = ClientModel(
        id: orderModel.clientModel?.id,
        name: orderModel.clientModel?.name,
        phone: orderModel.clientModel?.phone,
        address: orderModel.clientModel?.address);

    Map<String, dynamic> params = {
      "date": orderModel.date,
      "ammount": orderModel.ammount,
      "client": clientModel.toJson(),
      "user_id": "user_id 1"
    };


    final Response response = await httpManager.request(
        path: "/api/v1/orders", method: HttpMethods.Post, params: params);

    return response.statusCode == 201;
  }
}
