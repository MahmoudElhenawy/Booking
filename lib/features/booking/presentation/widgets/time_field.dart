import 'package:booking_app/core/widgets/custom_text_field.dart';
import 'package:booking_app/features/booking/presentation/controller/cubit/booking_cubit.dart';
import 'package:booking_app/features/booking/presentation/controller/cubit/booking_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeField extends StatefulWidget {
  const TimeField({super.key});

  @override
  State<TimeField> createState() => _TimeFieldState();
}

class _TimeFieldState extends State<TimeField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _openTimePicker() async {
    final selected = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selected != null) {
      context.read<BookingCubit>().selectTime(selected);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        final time = state.selectedTime;
        if (time != null) {
          _controller.text = time.format(context);
        }

        return CustomTextField(
          controller: _controller,
          labelText: "select_time".tr(),
          hintText: "select_time".tr(),
          readOnly: true,
          onTap: _openTimePicker,
          prefixIcon: const Icon(Icons.access_time),
        );
      },
    );
  }
}
