import 'package:booking_app/core/utils/app_colors.dart';
import 'package:booking_app/core/utils/app_styels.dart';
import 'package:booking_app/features/booking/domain/entities/transport_type.dart';
import 'package:booking_app/features/booking/domain/entities/trip_type.dart';
import 'package:booking_app/features/booking/presentation/model/search_results_args.dart';
import 'package:booking_app/features/booking/presentation/widgets/booking_locations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchSummaryCard extends StatelessWidget {
  final SearchResultsArgs summary;

  const SearchSummaryCard({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    final tripTypeLabel = summary.tripType == TripType.oneWay
        ? "one_way".tr()
        : "round_trip".tr();

    final dateText = summary.date == null
        ? "select_date".tr()
        : DateFormat('dd MMM yyyy').format(summary.date!);

    final timeText = summary.time == null
        ? "select_time".tr()
        : summary.time!.format(context);

    final fromLabel = formatLocation(context, summary.from);
    final toLabel = formatLocation(context, summary.to);
    final transportLabel = summary.transportType == TransportType.bus
        ? "bus".tr()
        : summary.transportType == TransportType.train
        ? "train".tr()
        : "flight".tr();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  fromLabel,
                  style: AppTextStyles.title.copyWith(color: AppColors.black),
                ),
              ),
              const Icon(Icons.arrow_forward, color: AppColors.grey, size: 18),
              Expanded(
                child: Text(
                  toLabel,
                  textAlign: TextAlign.end,
                  style: AppTextStyles.title.copyWith(color: AppColors.black),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _SummaryChip(label: transportLabel),
              _SummaryChip(label: tripTypeLabel),
              _SummaryChip(label: '${summary.travelers} ${"passengers".tr()}'),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                Icons.calendar_today_outlined,
                size: 16,
                color: AppColors.grey,
              ),
              const SizedBox(width: 8),
              Text(
                '${"departure_time".tr()}: $dateText',
                style: AppTextStyles.caption.copyWith(color: AppColors.black),
              ),
              const SizedBox(width: 12),
              const Icon(Icons.access_time, size: 16, color: AppColors.grey),
              const SizedBox(width: 6),
              Text(
                timeText,
                style: AppTextStyles.caption.copyWith(color: AppColors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SummaryChip extends StatelessWidget {
  final String label;

  const _SummaryChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.fill,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(
        label,
        style: AppTextStyles.caption.copyWith(
          color: AppColors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
