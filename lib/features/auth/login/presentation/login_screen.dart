import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/di/providers.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_textstyles.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_heading.dart';
import '../../../../core/widgets/app_logo.dart';
import '../../../../core/widgets/app_textfield.dart';
import '../data/models/login_request_model.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController =
  TextEditingController();

  final _passwordController =
  TextEditingController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref
          .read(loginViewModelProvider.notifier)
          .clearErrors();
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginViewModelProvider);
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("Login"),
      ),

      body: Center(
    child: ConstrainedBox(
    constraints: const BoxConstraints(
    maxWidth: 450,
    ),
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: SingleChildScrollView(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                const AppLogo(size: 90,),

                const SizedBox(height: 32),

                const AppHeading(
                  title: "Welcome Back 👋",
                  subtitle: "Sign in to continue shopping",
                ),


                const SizedBox(
                  height: AppSpacing.xl,
                ),

                AppTextField(
                  controller: _emailController,
                  label: "Email",
                  errorText: state.emailError,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email_outlined,
                  onChanged: (value) {
                    ref
                        .read(loginViewModelProvider.notifier)
                        .onEmailChanged(value);
                  },
                ),

                const SizedBox(height: 20),

                AppTextField(
                  controller: _passwordController,
                  label: "Password",
                  obscureText: true,
                  errorText: state.passwordError,
                  prefixIcon: Icons.lock_clock_outlined,
                  onChanged: (value) {
                    ref
                        .read(loginViewModelProvider.notifier)
                        .onPasswordChanged(value);
                  },
                ),

                const SizedBox(height: 30),

                AppButton(
                  text: "Sign In",
                  isLoading: state.isLoading,
                  onPressed: () async {

                    final success =
                    await ref
                        .read(loginViewModelProvider.notifier)
                        .login(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );

                    if (!mounted) return;

                    if (success) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Logged in Successfully"),
                        ),
                      );

                      context.go(AppRoutes.home);
                    }
                  },
                ),
                if (state.serverError != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      state.serverError!,
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    const Text("New User?"),

                    TextButton(
                      onPressed: () {
                        context.push(AppRoutes.signup);
                      },

                      child: const Text("Sign Up"),
                    ),

                  ],
                ),

              ],
            ),
          ),
        ),
      ),
      )
    );
  }
}