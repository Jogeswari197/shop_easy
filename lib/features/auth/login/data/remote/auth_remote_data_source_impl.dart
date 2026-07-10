import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_easy/core/network/api_constants.dart';

import '../models/login_request_model.dart';
import '../models/login_response_model.dart';
import '../models/sign_up_request_model.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl
    implements AuthRemoteDataSource {

  final FirebaseAuth _firebaseAuth;
  AuthRemoteDataSourceImpl(
      this._firebaseAuth);

  @override
  Future<LoginResponseModel> login(
      LoginRequestModel request,
      ) async {

    final userCredential =
    await _firebaseAuth.signInWithEmailAndPassword(
      email: request.email,
      password: request.password,
    );

    final token = await userCredential.user?.getIdToken();

    return LoginResponseModel(
      token: token ?? '',
    );
  }

  @override
  Future<LoginResponseModel> signUp(
      SignUpRequestModel request,
      ) async {

    final userCredential =
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: request.email,
      password: request.password,
    );

    final token =
    await userCredential.user?.getIdToken();

    return LoginResponseModel(
      token: token ?? '',
    );
  }
}