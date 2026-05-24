import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const root = '/';
  static const homeScreen = '/HomeScreen';
  static const loginScreen = '/LoginScreen';
  static const registerScreen = '/RegisterScreen';

  static final router = GoRouter(
    initialLocation: root,
    routes: [
      // GoRoute(path: '/', builder: (context, state) => SplashScreen()),
      // GoRoute(path: loginScreen, builder: (context, state) => LoginScreen()),
      // GoRoute(path: registerScreen, builder: (context, state) => RegisterScreen()),
    ],
  );
}
