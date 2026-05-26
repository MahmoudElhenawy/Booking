import 'package:booking_app/core/utils/app_colors.dart';
import 'package:booking_app/core/utils/app_styels.dart';
import 'package:booking_app/core/widgets/shimmer_box.dart';
import 'package:booking_app/features/booking/domain/entities/transport_type.dart';
import 'package:booking_app/features/booking/domain/entities/trip_result_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TripCard extends StatelessWidget {
  final TripResultEntity trip;

  const TripCard({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    final transportLabel = trip.transportType == TransportType.bus
        ? "bus".tr()
        : trip.transportType == TransportType.train
        ? "train".tr()
        : "flight".tr();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${"company".tr()}: ${trip.company}',
                style: AppTextStyles.bodyStrong.copyWith(
                  color: AppColors.black,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.fill,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.border),
                ),
                child: Text(
                  transportLabel,
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _TimeColumn(title: trip.departureTime, subtitle: trip.from),
              const Icon(Icons.arrow_forward, color: AppColors.grey),
              _TimeColumn(title: trip.arrivalTime, subtitle: trip.to),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${"price".tr()}: \$${trip.price.toStringAsFixed(0)}',
                style: AppTextStyles.bodyStrong.copyWith(
                  color: AppColors.primary,
                ),
              ),
              trip.seatNumber == null
                  ? const SizedBox.shrink()
                  : Text(
                      '${"seat_number".tr()}: ${trip.seatNumber}',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}

class TripCardSkeleton extends StatelessWidget {
  const TripCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerBox(
            width: 180,
            height: 16,
            borderRadius: BorderRadius.circular(10),
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerBox(
                    width: 64,
                    height: 16,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  const SizedBox(height: 6),
                  ShimmerBox(
                    width: 120,
                    height: 12,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ],
              ),
              const Icon(Icons.arrow_forward, color: AppColors.grey),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerBox(
                    width: 64,
                    height: 16,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  const SizedBox(height: 6),
                  ShimmerBox(
                    width: 120,
                    height: 12,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShimmerBox(
                width: 100,
                height: 16,
                borderRadius: BorderRadius.circular(10),
              ),
              ShimmerBox(
                width: 80,
                height: 12,
                borderRadius: BorderRadius.circular(10),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TimeColumn extends StatelessWidget {
  final String title;
  final String subtitle;

  const _TimeColumn({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.bodyStrong.copyWith(color: AppColors.black),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: AppTextStyles.caption.copyWith(color: AppColors.grey),
        ),
      ],
    );
  }
}
