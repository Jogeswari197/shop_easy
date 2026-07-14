
import 'package:shop_easy/features/auth/login/data/remote/auth_remote_data_source.dart';

import '../domain/auth_repository.dart';
import 'local/auth_local_data_source.dart';
import 'models/login_request_model.dart';
import 'models/sign_up_request_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  AuthRepositoryImpl(
      this._remoteDataSource,
      this._localDataSource,
      );

  @override
  Future<bool> isLoggedIn() async {
    return _remoteDataSource.isLoggedIn();
  }

  @override
  Future<bool> login(
      LoginRequestModel request,
      ) async {

    final response =
    await _remoteDataSource.login(request);

    await _localDataSource.saveToken(
      response.token,
    );

    return true;
  }

  @override
  Future<bool> signUp(
      SignUpRequestModel request,
      ) async {

    final response =
    await _remoteDataSource.signUp(request);

    await _localDataSource.saveToken(
      response.token,
    );

    return true;
  }
}