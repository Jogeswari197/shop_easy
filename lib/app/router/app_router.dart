import 'package:go_router/go_router.dart';

import '../../features/auth/login/presentation/login_screen.dart';
import '../../features/auth/signup/presentation/sign_up_screen.dart';
import '../../features/auth/splash/presentation/splash_screen.dart';
import '../../features/home/presentation/home.dart';
import 'app_routes.dart';

final appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.signup,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);