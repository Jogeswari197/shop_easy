import 'package:dio/dio.dart';
import 'package:shop_easy/core/network/api_constants.dart';

import '../models/login_request_model.dart';
import '../models/login_response_model.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl
    implements AuthRemoteDataSource {

  final Dio _dio;

  AuthRemoteDataSourceImpl(this._dio);

  @override
  Future<LoginResponseModel> login(
      LoginRequestModel request) async {
    final response = await _dio.post(
      ApiConstants.login,
      data: request.toJson(),
    );

    return LoginResponseModel.fromJson(response.data);

  }
}