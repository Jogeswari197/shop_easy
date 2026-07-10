import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/di/providers.dart';
import '../data/models/login_request_model.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
        centerTitle: true,
        title: const Text("Login"),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: SingleChildScrollView(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                TextField(
                  controller: _emailController,

                  decoration: const InputDecoration(
                    labelText: "Email",
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: _passwordController,

                  obscureText: true,

                  decoration: const InputDecoration(
                    labelText: "Password",
                  ),
                ),

                const SizedBox(height: 30),

                ElevatedButton(
                  onPressed: state.isLoading
                      ? null
                      : () async {

                    final success =
                    await ref
                        .read(loginViewModelProvider.notifier)
                        .login(email: _emailController.text, password: _passwordController.text);

                    if (!mounted) return;
                    if (success) {

                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Logged in Successfully",
                          ),
                        ),
                      );

                      context.go(AppRoutes.home);

                    }


                  },
                  child: state.isLoading
                      ? const CircularProgressIndicator()
                      : const Text("Login"),
                ),
                if (state.error != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      state.error!,
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
    );
  }
}