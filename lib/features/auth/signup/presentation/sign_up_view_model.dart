import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shop_easy/features/auth/signup/presentation/sign_up_state.dart';

import '../../../../core/validators/app_validator.dart';
import '../../login/data/models/sign_up_request_model.dart';
import '../../login/domain/auth_repository.dart';


class SignUpViewModel extends StateNotifier<SignUpState> {

  final AuthRepository _repository;

  SignUpViewModel(this._repository)
      : super(const SignUpState());

  Future<bool> signUp(
      SignUpRequestModel request,
      ) async {

    state = state.copyWith(
      nameError: null,
      emailError: null,
      passwordError: null,
      confirmPasswordError: null,
      errorMessage: null,
    );


      final nameError =
      AppValidator.validateName(request.name);

      final emailError =
      AppValidator.validateEmail(request.email);

      final passwordError =
      AppValidator.validatePassword(request.password);

      final confirmPasswordError =
      AppValidator.validateConfirmPassword(
        request.password,
        request.confirmPassword,
      );

      state = state.copyWith(
        nameError: nameError,
        emailError: emailError,
        passwordError: passwordError,
        confirmPasswordError: confirmPasswordError,
      );

      if (nameError != null ||
          emailError != null ||
          passwordError != null ||
          confirmPasswordError != null) {
        return false;
      }

      state = state.copyWith(
        isLoading: true,
      );



    try {
      await _repository.signUp(request);

      state = state.copyWith(
        isLoading: false,
      );

      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );

      return false;
    }

  }

  void onNameChanged(String value) {
    state = state.copyWith(
      nameError: AppValidator.validateName(value),
      errorMessage: null,
    );
  }

  void onEmailChanged(String value) {
    state = state.copyWith(
      emailError: AppValidator.validateEmail(value),
      errorMessage: null,
    );
  }

  void onPasswordChanged(String value) {
    state = state.copyWith(
      password: value,
      passwordError: AppValidator.validatePassword(value),
      confirmPasswordError:
      AppValidator.validateConfirmPassword(
        value,
        state.confirmPassword,
      ),
      errorMessage: null,
    );
  }

  void onConfirmPasswordChanged(String value) {
    state = state.copyWith(
      confirmPassword: value,
      confirmPasswordError:
      AppValidator.validateConfirmPassword(
        state.password,
        value,
      ),
      errorMessage: null,
    );
  }

  void clearErrors() {

    state = state.copyWith(
      nameError: null,
      emailError: null,
      passwordError: null,
      confirmPasswordError: null,
      errorMessage: null,
    );

  }

}