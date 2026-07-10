

import '../../login/domain/auth_repository.dart';

class SplashViewModel {
  final AuthRepository _repository;
  SplashViewModel(this._repository );


  Future<bool> checkLoginStatus() async {
    return _repository.isLoggedIn();
  }

}