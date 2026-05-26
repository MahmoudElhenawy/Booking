import 'package:booking_app/core/widgets/custom_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ToField extends StatelessWidget {
  const ToField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      labelText: "to".tr(),
      hintText: "destination_city".tr(),
      prefixIcon: const Icon(Icons.location_on_outlined),
    );
  }
}
