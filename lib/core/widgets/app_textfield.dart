import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? errorText;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  final IconData? prefixIcon;

  const AppTextField({
    super.key,
    required this.controller,
    required this.label,
    this.errorText,
    this.obscureText = false,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.prefixIcon
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        errorText: errorText,
        prefixIcon:
        prefixIcon != null
            ? Icon(prefixIcon)
            : null,
      ),
    );
  }
}