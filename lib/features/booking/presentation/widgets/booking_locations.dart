import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BookingLocation {
  final String id;
  final String cityKey;
  final String countryCode;

  const BookingLocation({
    required this.id,
    required this.cityKey,
    required this.countryCode,
  });
}

const List<BookingLocation> bookingLocations = [
  BookingLocation(id: 'cairo_eg', cityKey: 'city_cairo', countryCode: 'EG'),
  BookingLocation(
    id: 'alexandria_eg',
    cityKey: 'city_alexandria',
    countryCode: 'EG',
  ),
  BookingLocation(
    id: 'istanbul_tr',
    cityKey: 'city_istanbul',
    countryCode: 'TR',
  ),
  BookingLocation(id: 'dubai_ae', cityKey: 'city_dubai', countryCode: 'AE'),
  BookingLocation(id: 'paris_fr', cityKey: 'city_paris', countryCode: 'FR'),
  BookingLocation(id: 'rome_it', cityKey: 'city_rome', countryCode: 'IT'),
  BookingLocation(id: 'milan_it', cityKey: 'city_milan', countryCode: 'IT'),
];

String formatLocation(BuildContext context, String id) {
  final location = bookingLocations.firstWhere(
    (item) => item.id == id,
    orElse: () => bookingLocations.first,
  );

  final city = location.cityKey.tr();

  return '$city, ${location.countryCode}';
}
