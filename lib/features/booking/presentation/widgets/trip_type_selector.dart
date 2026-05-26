import 'package:booking_app/core/utils/app_colors.dart';
import 'package:booking_app/core/utils/app_styels.dart';
import 'package:booking_app/features/booking/domain/entities/trip_type.dart';
import 'package:booking_app/features/booking/presentation/controller/cubit/booking_cubit.dart';
import 'package:booking_app/features/booking/presentation/controller/cubit/booking_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TripTypeSelector extends StatelessWidget {
  const TripTypeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: _TripTypeOption(
                title: "one_way".tr(),
                isSelected: state.selectedTripType == TripType.oneWay,
                onTap: () => context.read<BookingCubit>().selectTripType(
                  TripType.oneWay,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _TripTypeOption(
                title: "round_trip".tr(),
                isSelected: state.selectedTripType == TripType.roundTrip,
                onTap: () => context.read<BookingCubit>().selectTripType(
                  TripType.roundTrip,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _TripTypeOption extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _TripTypeOption({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : AppColors.fill,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border),
          ),
          child: Center(
            child: Text(
              title,
              style: AppTextStyles.bodyStrong.copyWith(
                color: isSelected ? Colors.white : AppColors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
