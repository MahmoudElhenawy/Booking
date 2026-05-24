import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ButtonChangeLanguage extends StatelessWidget {
  const ButtonChangeLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (context.locale.languageCode == 'ar') {
          context.setLocale(const Locale('en'));
        } else {
          context.setLocale(const Locale('ar'));
        }
      },

      icon: const Icon(Icons.language),
    );
  }
}
