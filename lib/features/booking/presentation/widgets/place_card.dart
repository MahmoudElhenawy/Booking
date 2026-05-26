import 'package:booking_app/core/utils/app_colors.dart';
import 'package:booking_app/core/utils/app_styels.dart';
import 'package:booking_app/features/booking/domain/entities/trip_entity.dart';
import 'package:flutter/material.dart';

class PlaceCard extends StatelessWidget {
  final TripEntity trip;

  const PlaceCard({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
            child: Image.asset(
              trip.image,
              height: 110,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${trip.city}, ${trip.country}',
                  style: AppTextStyles.bodyStrong.copyWith(
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '\$${trip.price.toStringAsFixed(0)}',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
