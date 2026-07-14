import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/di/providers.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_heading.dart';
import '../../../../core/widgets/app_logo.dart';
import '../../../../core/widgets/app_textfield.dart';
import '../../login/data/models/sign_up_request_model.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref
          .read(signUpViewModelProvider.notifier)
          .clearErrors();
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state =
    ref.watch(signUpViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Sign Up"),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: SingleChildScrollView(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                const AppLogo(size: 60,),

                const SizedBox(height: AppSpacing.xl),

                const AppHeading(
                  title: "Create Account",
                  subtitle: "Join ShopEasy today!",
                ),

                const SizedBox(height: 40),
                AppTextField(
                  controller: _nameController,
                  label: "Name",
                  errorText: state.nameError,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    ref
                        .read(signUpViewModelProvider.notifier)
                        .onNameChanged(value);
                  },
                ),

                const SizedBox(height: 20),
                AppTextField(
                  controller: _emailController,
                  label: "Email",
                  errorText: state.emailError,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    ref
                        .read(signUpViewModelProvider.notifier)
                        .onEmailChanged(value);
                  },
                ),

                const SizedBox(height: 20),

                AppTextField(
                  controller: _passwordController,
                  label: "Password",
                  errorText: state.passwordError,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    ref
                        .read(signUpViewModelProvider.notifier)
                        .onPasswordChanged(value);
                  },
                ),

                const SizedBox(height: 20),

                AppTextField(
                  controller: _confirmPasswordController,
                  label: "Confirm Password",
                  errorText: state.confirmPasswordError,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    ref
                        .read(signUpViewModelProvider.notifier)
                        .onConfirmPasswordChanged(value);
                  },
                ),

                const SizedBox(height: 30),

                // ElevatedButton(
                //   onPressed: state.isLoading
                //       ? null
                //       : () async {
                //
                //     final request =
                //     SignUpRequestModel(
                //       name: _nameController.text,
                //       email: _emailController.text,
                //       password: _passwordController.text,
                //       confirmPassword:
                //       _confirmPasswordController.text,
                //     );
                //
                //     final success = await ref
                //         .read(signUpViewModelProvider.notifier)
                //         .signUp(request);
                //
                //     if (!mounted) return;
                //
                //     if (success) {
                //
                //       ScaffoldMessenger.of(context)
                //           .showSnackBar(
                //         const SnackBar(
                //           content: Text(
                //             "Account Created Successfully",
                //           ),
                //         ),
                //       );
                //
                //       context.pop();
                //
                //     }
                //
                //   },
                //
                //   child: state.isLoading
                //       ? const CircularProgressIndicator()
                //       : const Text("Create Account"),
                // ),

                AppButton(
                  text: "Create Account",
                  isLoading: state.isLoading,
                  onPressed: () async {

                        final request =
                        SignUpRequestModel(
                          name: _nameController.text,
                          email: _emailController.text,
                          password: _passwordController.text,
                          confirmPassword:
                          _confirmPasswordController.text,
                        );

                            final success = await ref
                                .read(signUpViewModelProvider.notifier)
                                .signUp(request);

                    if (!mounted) return;

                    if (success) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Account Created Successfully",
                                ),
                              ),
                            );

                      context.pop();
                    }
                  },
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    const Text("Existing User?"),

                    TextButton(
                      onPressed: () {
                        context.push(AppRoutes.login);
                      },

                      child: const Text("Login"),
                    ),

                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}