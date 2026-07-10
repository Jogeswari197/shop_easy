class SignUpRequestModel {

  final String name;

  final String email;

  final String password;

  final String confirmPassword;

  const SignUpRequestModel({

    required this.name,

    required this.email,

    required this.password,

    required this.confirmPassword,

  });

}