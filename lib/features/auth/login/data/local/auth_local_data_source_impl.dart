import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'auth_local_data_source.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {

  final FlutterSecureStorage _storage;

  AuthLocalDataSourceImpl(this._storage);

  @override
  Future<void> saveToken(String token) async {
    await _storage.write(
      key: 'token',
      value: token,
    );
  }

  @override
  Future<String?> getToken() async {
    return await _storage.read(
      key: 'token',
    );
  }

  @override
  Future<void> deleteToken() async {
    await _storage.delete(
      key: 'token',
    );
  }
}