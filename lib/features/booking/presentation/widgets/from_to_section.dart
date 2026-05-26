import 'package:flutter/material.dart';
import 'package:booking_app/features/booking/presentation/widgets/from_dropdown_field.dart';
import 'package:booking_app/features/booking/presentation/widgets/to_dropdown_field.dart';

class FromToSection extends StatelessWidget {
  const FromToSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [FromDropdownField(), SizedBox(height: 20), ToDropdownField()],
    );
  }
}
