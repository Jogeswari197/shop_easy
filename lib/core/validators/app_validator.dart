class AppValidator {
  AppValidator._();

  static String? validateEmail(String email) {
    if (email.trim().isEmpty) {
      return "Email is required";
    }

    final emailRegex = RegExp(
      r'^[^@]+@[^@]+\.[^@]+$',
    );

    if (!emailRegex.hasMatch(email)) {
      return "Enter a valid email";
    }

    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return "Password is required";
    }

    if (password.length < 6) {
      return "Password must be at least 6 characters";
    }

    return null;
  }

  static String? validateName(String name) {
    if (name.trim().isEmpty) {
      return "Name is required";
    }

    return null;
  }

  static String? validateConfirmPassword(
      String password,
      String confirmPassword,
      ) {
    if (confirmPassword.isEmpty) {
      return "Confirm password is required";
    }

    if (password != confirmPassword) {
      return "Passwords do not match";
    }

    return null;
  }
}