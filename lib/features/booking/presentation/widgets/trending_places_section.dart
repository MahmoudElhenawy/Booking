import 'package:booking_app/core/utils/app_colors.dart';
import 'package:booking_app/core/utils/app_styels.dart';
import 'package:booking_app/core/widgets/shimmer_box.dart';
import 'package:booking_app/features/booking/presentation/controller/cubit/booking_cubit.dart';
import 'package:booking_app/features/booking/presentation/controller/cubit/booking_state.dart';
import 'package:booking_app/features/booking/presentation/widgets/place_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingPlacesSection extends StatelessWidget {
  const TrendingPlacesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "trending_getaways".tr(),
                style: AppTextStyles.title.copyWith(color: AppColors.black),
              ),
              TextButton(onPressed: () {}, child: Text("view_all".tr())),
            ],
          ),
          const SizedBox(height: 16),
          BlocBuilder<BookingCubit, BookingState>(
            builder: (context, state) {
              if (state.trendingStatus == TripsStatus.loading) {
                return SizedBox(
                  height: 190,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    separatorBuilder: (_, __) => const SizedBox(width: 16),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShimmerBox(
                            width: 170,
                            height: 110,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          const SizedBox(height: 12),
                          ShimmerBox(
                            width: 120,
                            height: 14,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          const SizedBox(height: 6),
                          ShimmerBox(
                            width: 60,
                            height: 12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ],
                      );
                    },
                  ),
                );
              }

              if (state.trendingStatus == TripsStatus.error) {
                return Text(
                  state.trendingErrorMessage ?? 'unknown_error'.tr(),
                  style: AppTextStyles.caption.copyWith(color: AppColors.error),
                );
              }

              return SizedBox(
                height: 190,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.trendingTrips.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    return PlaceCard(trip: state.trendingTrips[index]);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
