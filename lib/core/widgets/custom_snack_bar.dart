import 'package:booking_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {
  static void success(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),

        backgroundColor: AppColors.success,

        behavior: SnackBarBehavior.floating,

        margin: const EdgeInsets.all(16),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

        duration: const Duration(seconds: 2),
      ),
    );
  }

  static void error(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),

        backgroundColor: AppColors.error,

        behavior: SnackBarBehavior.floating,

        margin: const EdgeInsets.all(16),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

        duration: const Duration(seconds: 2),
      ),
    );
  }
}
