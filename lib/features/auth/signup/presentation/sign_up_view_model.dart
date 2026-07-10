import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shop_easy/features/auth/signup/presentation/sign_up_state.dart';

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
      isLoading: true,
      errorMessage: null,
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

}