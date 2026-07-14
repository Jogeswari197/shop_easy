class SignUpState {
  final bool isLoading;
  final String password;
  final String confirmPassword;
  final String? errorMessage;
  final String? nameError;
  final String? emailError;
  final String? passwordError;
  final String? confirmPasswordError;

  const SignUpState({
    this.isLoading = false,
    this.password = "",
    this.confirmPassword = "",
    this.errorMessage,
    this.nameError,
    this.emailError,
    this.passwordError,
    this.confirmPasswordError
  });



  SignUpState copyWith({
    bool? isLoading,
    String? errorMessage,
    String? password,
    String? confirmPassword,
    final String? nameError,
    final String? emailError,
    final String? passwordError,
    final String? confirmPasswordError,
  }) {
    return SignUpState(
      isLoading: isLoading ?? this.isLoading,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      errorMessage: errorMessage,
      nameError: nameError,
      passwordError: passwordError,
      emailError: emailError,
      confirmPasswordError: confirmPasswordError
    );
  }
}