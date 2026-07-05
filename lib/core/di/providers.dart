import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../features/login/data/auth_repository_impl.dart';
import '../../features/login/data/local/auth_local_data_source.dart';
import '../../features/login/data/local/auth_local_data_source_impl.dart';
import '../../features/login/domain/auth_repository.dart';
import '../../features/splash/presentation/splash_view_model.dart';

final secureStorageProvider =
Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});


final authLocalDataSourceProvider =
Provider<AuthLocalDataSource>((ref) {

  final storage = ref.read(secureStorageProvider);

  return AuthLocalDataSourceImpl(storage);
});



final authRepositoryProvider =
Provider<AuthRepository>((ref) {

  final local = ref.read(authLocalDataSourceProvider);

  return AuthRepositoryImpl(local);
});



final splashViewModelProvider =
Provider<SplashViewModel>((ref) {

  final repository = ref.read(authRepositoryProvider);

  return SplashViewModel(repository);
});









