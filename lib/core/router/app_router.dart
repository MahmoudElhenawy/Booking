import 'package:booking_app/features/auth/presentation/screen/login_screen.dart';
import 'package:booking_app/features/auth/presentation/screen/register_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const root = '/';
  static const homeScreen = '/HomeScreen';
  static const loginScreen = '/LoginScreen';
  static const registerScreen = '/RegisterScreen';

  static final router = GoRouter(
    initialLocation: root,
    routes: [
      GoRoute(path: '/', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: registerScreen,
        builder: (context, state) => const RegisterScreen(),
      ),
    ],
  );
}
