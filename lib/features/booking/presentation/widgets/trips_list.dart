import 'package:booking_app/core/utils/app_colors.dart';
import 'package:booking_app/core/utils/app_styels.dart';
import 'package:booking_app/features/booking/presentation/controller/cubit/booking_cubit.dart';
import 'package:booking_app/features/booking/presentation/controller/cubit/booking_state.dart';
import 'package:booking_app/features/booking/presentation/widgets/trip_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TripsList extends StatelessWidget {
  const TripsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        if (state.searchStatus == TripsStatus.initial) {
          return const SizedBox.shrink();
        }

        if (state.searchStatus == TripsStatus.loading) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "available_trips".tr(),
                  style: AppTextStyles.title.copyWith(color: AppColors.black),
                ),
                const SizedBox(height: 12),
                const TripCardSkeleton(),
                const SizedBox(height: 16),
                const TripCardSkeleton(),
                const SizedBox(height: 16),
                const TripCardSkeleton(),
              ],
            ),
          );
        }

        if (state.searchStatus == TripsStatus.error) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              state.searchErrorMessage ?? "unknown_error".tr(),
              style: AppTextStyles.caption.copyWith(color: AppColors.error),
            ),
          );
        }

        if (state.searchResults.isEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "available_trips".tr(),
                  style: AppTextStyles.title.copyWith(color: AppColors.black),
                ),
                const SizedBox(height: 12),
                Text(
                  "no_trips_found".tr(),
                  style: AppTextStyles.caption.copyWith(color: AppColors.grey),
                ),
              ],
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "available_trips".tr(),
                style: AppTextStyles.title.copyWith(color: AppColors.black),
              ),
              const SizedBox(height: 16),
              ListView.separated(
                itemCount: state.searchResults.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  return TripCard(trip: state.searchResults[index]);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
