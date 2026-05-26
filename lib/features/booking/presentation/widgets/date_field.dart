import 'package:booking_app/core/widgets/custom_text_field.dart';
import 'package:booking_app/features/booking/presentation/controller/cubit/booking_cubit.dart';
import 'package:booking_app/features/booking/presentation/controller/cubit/booking_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DateField extends StatefulWidget {
  const DateField({super.key});

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _openDatePicker() {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      currentTime: DateTime.now(),
      minTime: DateTime.now().subtract(const Duration(days: 1)),
      maxTime: DateTime.now().add(const Duration(days: 365)),
      onConfirm: (date) {
        context.read<BookingCubit>().selectDate(date);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        final date = state.selectedDate;
        if (date != null) {
          _controller.text = DateFormat('MM/dd/yyyy').format(date);
        }

        return CustomTextField(
          controller: _controller,
          labelText: "select_date".tr(),
          hintText: "select_date".tr(),
          readOnly: true,
          onTap: _openDatePicker,
          prefixIcon: const Icon(Icons.calendar_today_outlined),
        );
      },
    );
  }
}
