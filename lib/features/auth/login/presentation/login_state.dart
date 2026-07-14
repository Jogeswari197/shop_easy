class LoginState {
  final bool isLoading;
  final String? serverError;
  final String? emailError;
  final String? passwordError;

  const LoginState({
    this.isLoading = false,
    this.serverError,
    this.emailError,
    this.passwordError
  });

  LoginState copyWith({
    bool? isLoading,
    String? error,
    String? emailError,
    String? passwordError
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      serverError: error,
      emailError: emailError,
      passwordError: passwordError
    );
  }
}