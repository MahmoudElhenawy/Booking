import 'package:booking_app/features/booking/domain/entities/transport_type.dart';
import 'package:booking_app/features/booking/domain/entities/trip_type.dart';
import 'package:flutter/material.dart';

class SearchResultsArgs {
  final TransportType transportType;
  final TripType tripType;
  final String from;
  final String to;
  final DateTime? date;
  final TimeOfDay? time;
  final int travelers;

  const SearchResultsArgs({
    required this.transportType,
    required this.tripType,
    required this.from,
    required this.to,
    required this.date,
    required this.time,
    required this.travelers,
  });
}
