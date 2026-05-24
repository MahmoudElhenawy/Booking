import 'package:booking_app/core/localization/config_localization.dart';
import 'package:booking_app/core/router/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  runApp(ConfgLocalization());
}

class Booking extends StatelessWidget {
  const Booking({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,

      debugShowCheckedModeBanner: false,

      locale: context.locale,

      supportedLocales: context.supportedLocales,

      localizationsDelegates: context.localizationDelegates,
    );
  }
}
