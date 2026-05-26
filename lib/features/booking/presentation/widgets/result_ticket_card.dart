import 'package:booking_app/core/utils/app_colors.dart';
import 'package:booking_app/core/utils/app_styels.dart';
import 'package:booking_app/core/widgets/custom_button.dart';
import 'package:booking_app/features/booking/domain/entities/transport_type.dart';
import 'package:booking_app/features/booking/domain/entities/trip_result_entity.dart';
import 'package:booking_app/features/booking/domain/entities/trip_type.dart';
import 'package:booking_app/features/booking/presentation/widgets/booking_locations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ResultTicketCard extends StatelessWidget {
  final TripResultEntity trip;
  final VoidCallback? onSelect;

  const ResultTicketCard({super.key, required this.trip, this.onSelect});

  @override
  Widget build(BuildContext context) {
    final transportIcon = trip.transportType == TransportType.bus
        ? Icons.directions_bus
        : trip.transportType == TransportType.train
        ? Icons.train
        : Icons.flight;

    final transportLabel = trip.transportType == TransportType.bus
        ? "bus".tr()
        : trip.transportType == TransportType.train
        ? "train".tr()
        : "flight".tr();

    final tripTypeLabel = trip.tripType == TripType.oneWay
        ? "one_way".tr()
        : "round_trip".tr();

    final fromLabel = formatLocation(context, trip.from);
    final toLabel = formatLocation(context, trip.to);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.fill,
                child: Icon(transportIcon, size: 18, color: AppColors.primary),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  trip.company,
                  style: AppTextStyles.bodyStrong.copyWith(
                    color: AppColors.black,
                  ),
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
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _TimeColumn(
                title: "departure_time".tr(),
                value: trip.departureTime,
                subtitle: fromLabel,
              ),
              _TimeColumn(
                title: "arrival_time".tr(),
                value: trip.arrivalTime,
                subtitle: toLabel,
              ),
              _TimeColumn(title: "duration".tr(), value: trip.duration),
            ],
          ),
          const SizedBox(height: 12),
          Divider(color: AppColors.border),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                '${"trip_details".tr()}: $tripTypeLabel',
                style: AppTextStyles.caption.copyWith(color: AppColors.grey),
              ),
              const SizedBox(width: 12),
              if (trip.seatNumber != null)
                Text(
                  '${"seat_number".tr()}: ${trip.seatNumber}',
                  style: AppTextStyles.caption.copyWith(color: AppColors.grey),
                ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${"price".tr()}: \$${trip.price.toStringAsFixed(0)}',
                style: AppTextStyles.bodyStrong.copyWith(
                  color: AppColors.primary,
                ),
              ),
              SizedBox(
                width: 140,
                child: CustomButton(
                  text: "select_ticket".tr(),
                  onPressed: onSelect,
                ),
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
  final String value;
  final String? subtitle;

  const _TimeColumn({required this.title, required this.value, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.caption.copyWith(color: AppColors.grey),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: AppTextStyles.bodyStrong.copyWith(color: AppColors.black),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 4),
          Text(
            subtitle!,
            style: AppTextStyles.caption.copyWith(color: AppColors.grey),
          ),
        ],
      ],
    );
  }
}
