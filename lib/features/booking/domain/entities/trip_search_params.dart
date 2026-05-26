import 'package:booking_app/features/booking/domain/entities/transport_type.dart';
import 'package:booking_app/features/booking/domain/entities/trip_type.dart';
import 'package:flutter/material.dart';

class TripSearchParams {
  final String from;
  final String to;
  final TransportType transportType;
  final TripType tripType;
  final DateTime? date;
  final TimeOfDay? time;

  const TripSearchParams({
    required this.from,
    required this.to,
    required this.transportType,
    required this.tripType,
    this.date,
    this.time,
  });
}
