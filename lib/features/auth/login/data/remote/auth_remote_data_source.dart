import '../models/login_request_model.dart';
import '../models/login_response_model.dart';
import '../models/sign_up_request_model.dart';

abstract class AuthRemoteDataSource {

  Future<LoginResponseModel> login(
      LoginRequestModel request,
      );

  Future<LoginResponseModel> signUp(
      SignUpRequestModel request,
      );

  Future<bool> isLoggedIn();

}