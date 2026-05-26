import 'package:flutter/material.dart';

abstract class Styles {
  static const textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );
  static const textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
  static const textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static const textStyle30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w600,
  );
}

class AppTextStyles {
  const AppTextStyles._();

  static const headline = TextStyle(fontSize: 30, fontWeight: FontWeight.w700);

  static const title = TextStyle(fontSize: 22, fontWeight: FontWeight.w700);

  static const body = TextStyle(fontSize: 16, fontWeight: FontWeight.w400);

  static const bodyStrong = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const caption = TextStyle(fontSize: 14, fontWeight: FontWeight.w400);

  static const button = TextStyle(fontSize: 16, fontWeight: FontWeight.w700);
}
