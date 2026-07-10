import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../features/auth/login/data/auth_repository_impl.dart';
import '../../features/auth/login/data/local/auth_local_data_source.dart';
import '../../features/auth/login/data/local/auth_local_data_source_impl.dart';
import '../../features/auth/login/data/remote/auth_remote_data_source.dart';
import '../../features/auth/login/data/remote/auth_remote_data_source_impl.dart';
import '../../features/auth/login/domain/auth_repository.dart';
import '../../features/auth/login/presentation/login_state.dart';
import '../../features/auth/login/presentation/login_view_model.dart';
import '../../features/auth/signup/presentation/sign_up_state.dart';
import '../../features/auth/signup/presentation/sign_up_view_model.dart';
import '../../features/auth/splash/presentation/splash_view_model.dart';
import '../network/dio_provider.dart';

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

  final remote = ref.read(authRemoteDataSourceProvider);

  final local = ref.read(authLocalDataSourceProvider);

  return AuthRepositoryImpl(
    remote,
    local,
  );
});



final splashViewModelProvider =
Provider<SplashViewModel>((ref) {

  final repository = ref.read(authRepositoryProvider);

  return SplashViewModel(repository);
});


final loginViewModelProvider =
StateNotifierProvider<LoginViewModel, LoginState>((ref) {

  final repository =
  ref.read(authRepositoryProvider);

  return LoginViewModel(repository);

});



final firebaseAuthProvider =
Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final authRemoteDataSourceProvider =
Provider<AuthRemoteDataSource>((ref) {

  final dio = ref.read(dioProvider);
  final firebaseAuth = ref.read(firebaseAuthProvider);

  return AuthRemoteDataSourceImpl( firebaseAuth);
});

final signUpViewModelProvider =
StateNotifierProvider<
    SignUpViewModel,
    SignUpState>((ref) {

  final repository =
  ref.read(authRepositoryProvider);

  return SignUpViewModel(repository);

});









