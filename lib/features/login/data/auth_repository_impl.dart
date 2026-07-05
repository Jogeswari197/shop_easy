import 'package:shop_easy/features/login/data/local/auth_local_data_source.dart';
import 'package:shop_easy/features/login/domain/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  final  AuthLocalDataSource _localDataSource;
  AuthRepositoryImpl(this._localDataSource);

  @override
  Future<bool> isLoggedIn() async {
    final token = await _localDataSource.getToken();

    return token != null;
  }
}