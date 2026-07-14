import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../../../core/validators/app_validator.dart';
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

    // Clear old errors
    state = state.copyWith(
      emailError: null,
      passwordError: null,
      error: null,
    );

    final request = LoginRequestModel(
      email: email,
      password: password,
    );

    final emailError =
    AppValidator.validateEmail(request.email);

    final passwordError =
    AppValidator.validatePassword(request.password);

    state = state.copyWith(
      emailError: emailError,
      passwordError: passwordError,
    );

    if (emailError != null ||
        passwordError != null) {
      return false;
    }

    // Start loading ONLY after validation
    state = state.copyWith(
      isLoading: true,
    );

    try {

      final success =
      await _repository.login(request);

      state = state.copyWith(
        isLoading: false,
      );

      return success;

    } catch (e) {
      state = state.copyWith(
        isLoading: false,
      );

      if (e is FirebaseAuthException) {
        state = state.copyWith(
          error: _getFirebaseErrorMessage(e),
        );
      } else {
        state = state.copyWith(
          error: "Something went wrong. Please try again.",
        );
      }

      return false;
    }




  }

  void onEmailChanged(String value) {

    state = state.copyWith(
      emailError:
      AppValidator.validateEmail(value),
    );

  }

  void onPasswordChanged(String value) {

    state = state.copyWith(
      passwordError:
      AppValidator.validatePassword(value),
    );

  }

  void clearErrors() {

    state = state.copyWith(
      emailError: null,
      passwordError: null,
      error: null,
    );

  }

  String _getFirebaseErrorMessage(
      FirebaseAuthException exception,
      ) {
    switch (exception.code) {

      case 'invalid-credential':
        return "Incorrect email or password.";

      case 'user-not-found':
        return "No account found with this email.";

      case 'wrong-password':
        return "Incorrect password.";

      case 'too-many-requests':
        return "Too many attempts. Please try again later.";

      case 'network-request-failed':
        return "Please check your internet connection.";

      default:
        return exception.message ??
            "Something went wrong.";
    }
  }
}