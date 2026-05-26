import 'package:booking_app/core/utils/app_colors.dart';
import 'package:booking_app/core/utils/app_styels.dart';
import 'package:booking_app/core/widgets/custom_button.dart';
import 'package:booking_app/features/booking/presentation/controller/cubit/booking_cubit.dart';
import 'package:booking_app/features/booking/presentation/controller/cubit/booking_state.dart';
import 'package:booking_app/features/booking/presentation/widgets/result_ticket_card.dart';
import 'package:booking_app/features/booking/presentation/widgets/trip_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultsList extends StatelessWidget {
  const ResultsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        if (state.searchStatus == TripsStatus.loading) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TripCardSkeleton(),
                const SizedBox(height: 16),
                const TripCardSkeleton(),
                const SizedBox(height: 16),
                const TripCardSkeleton(),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    "loading_results".tr(),
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        if (state.searchStatus == TripsStatus.error) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  state.searchErrorMessage ?? "unknown_error".tr(),
                  style: AppTextStyles.caption.copyWith(color: AppColors.error),
                ),
                const SizedBox(height: 12),
                CustomButton(
                  text: "retry".tr(),
                  onPressed: () => context.read<BookingCubit>().searchTrips(),
                ),
              ],
            ),
          );
        }

        if (state.searchResults.isEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 8),
                Icon(Icons.search_off, color: AppColors.grey, size: 48),
                const SizedBox(height: 10),
                Text(
                  "no_tickets_found".tr(),
                  style: AppTextStyles.bodyStrong.copyWith(
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 14),
                CustomButton(
                  text: "retry".tr(),
                  onPressed: () => context.read<BookingCubit>().searchTrips(),
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
              ListView.separated(
                itemCount: state.searchResults.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final ticket = state.searchResults[index];

                  return ResultTicketCard(trip: ticket, onSelect: () {});
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
