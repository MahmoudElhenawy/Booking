import 'package:booking_app/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ConfgLocalization extends StatelessWidget {
  const ConfgLocalization({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],

      path: 'assets/translations',

      fallbackLocale: const Locale('ar'),

      startLocale: const Locale('ar'),

      useOnlyLangCode: true,

      child: const Booking(),
    );
  }
}
