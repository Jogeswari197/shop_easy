import 'package:flutter_riverpod/legacy.dart';

import '../data/models/login_request_model.dart';
import '../domain/auth_repository.dart';
import 'login_state.dart';

class LoginViewModel extends StateNotifier<LoginState> {
  final AuthRepository _repository;

  LoginViewModel(this._repository)
      : super(const LoginState());

  Future<bool> login({
    required String email,
    required String password,
  }) async {

    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      final request = LoginRequestModel(
        email: email,
        password: password,
      );

      final success =
      await _repository.login(request);

      state = state.copyWith(
        isLoading: false,
      );

      return success;

    } catch (e) {

      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );

      return false;
    }
  }
}