import 'package:booking_app/core/widgets/custom_text_field.dart';
import 'package:booking_app/features/booking/presentation/controller/cubit/booking_cubit.dart';
import 'package:booking_app/features/booking/presentation/controller/cubit/booking_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TravelersField extends StatefulWidget {
  const TravelersField({super.key});

  @override
  State<TravelersField> createState() => _TravelersFieldState();
}

class _TravelersFieldState extends State<TravelersField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _selectTravelers() {
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
            itemCount: 6,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final count = index + 1;
              final label = '$count ${"passenger".tr()}';

              return ListTile(
                title: Text(label),
                onTap: () {
                  cubit.selectTravelers(count);
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
        _controller.text = '${state.selectedTravelers} ${"passenger".tr()}';

        return CustomTextField(
          controller: _controller,
          labelText: "travelers".tr(),
          hintText: "1 ${"passenger".tr()}",
          readOnly: true,
          onTap: _selectTravelers,
          suffixIcon: const Icon(Icons.keyboard_arrow_down),
          prefixIcon: const Icon(Icons.people_outline),
        );
      },
    );
  }
}
