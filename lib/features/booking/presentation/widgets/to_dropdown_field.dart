import 'package:booking_app/core/widgets/custom_text_field.dart';
import 'package:booking_app/features/booking/presentation/controller/cubit/booking_cubit.dart';
import 'package:booking_app/features/booking/presentation/controller/cubit/booking_state.dart';
import 'package:booking_app/features/booking/presentation/widgets/booking_locations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDropdownField extends StatefulWidget {
  const ToDropdownField({super.key});

  @override
  State<ToDropdownField> createState() => _ToDropdownFieldState();
}

class _ToDropdownFieldState extends State<ToDropdownField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _openLocations() {
    final cubit = context.read<BookingCubit>();

    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: bookingLocations.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final location = bookingLocations[index];
              final label = formatLocation(context, location.id);

              return ListTile(
                title: Text(label),
                onTap: () {
                  cubit.selectTo(location.id);
                  Navigator.of(context).pop();
                },
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        final label = formatLocation(context, state.selectedTo);
        if (_controller.text != label) {
          _controller.text = label;
        }

        return CustomTextField(
          controller: _controller,
          labelText: "arrival".tr(),
          hintText: "arrival".tr(),
          readOnly: true,
          onTap: _openLocations,
          prefixIcon: const Icon(Icons.flight_land),
          suffixIcon: const Icon(Icons.keyboard_arrow_down),
        );
      },
    );
  }
}
