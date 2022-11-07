import 'dart:convert';

import 'package:dio/dio.dart';
import '../../../../../core/utils/managers/http/http_manager.dart';
import '../../../../../core/utils/managers/http/http_methods.dart';

abstract class LoginDataSource {
  Future<Map<String, dynamic>> login(Map<String, dynamic> data);
}

class LoginDataSourceImpl implements LoginDataSource {
  final HttpManager httpManager;

  LoginDataSourceImpl({
    required this.httpManager,
  });

  @override
  Future<Map<String, dynamic>> login(Map<String, dynamic> data) async {
    final Response response = await httpManager.request(
        path: "sign_in/", method: HttpMethods.Post, params: data, headers: {});
    return json.decode(response.data as String) as Map<String, dynamic>;
  }
}
