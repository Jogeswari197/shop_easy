import '../data/models/login_request_model.dart';
import '../data/models/sign_up_request_model.dart';

abstract class AuthRepository {
  Future<bool> isLoggedIn();

  Future<bool> login(LoginRequestModel request);

  Future<bool> signUp(
      SignUpRequestModel request,
      );
}