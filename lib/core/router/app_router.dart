import 'package:booking_app/features/auth/presentation/screen/login_screen.dart';
import 'package:booking_app/features/auth/presentation/screen/register_screen.dart';
import 'package:booking_app/features/booking/presentation/screens/home_screen.dart';
import 'package:booking_app/features/booking/presentation/screens/search_results_screen.dart';
import 'package:booking_app/features/booking/presentation/model/search_results_args.dart';
import 'package:booking_app/features/booking/di/booking_di.dart';
import 'package:booking_app/features/booking/presentation/controller/cubit/booking_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const root = '/';
  static const homeScreen = '/HomeScreen';
  static const searchResults = '/SearchResults';
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
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider.value(value: getIt<BookingCubit>(), child: child);
        },
        routes: [
          GoRoute(
            path: homeScreen,
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: searchResults,
            builder: (context, state) {
              final args = state.extra as SearchResultsArgs?;

              return SearchResultsScreen(summary: args);
            },
          ),
        ],
      ),
    ],
  );
}
