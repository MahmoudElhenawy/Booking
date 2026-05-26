import 'package:booking_app/features/booking/domain/entities/transport_type.dart';
import 'package:booking_app/features/booking/domain/entities/trip_type.dart';
import 'package:equatable/equatable.dart';

class TripResultEntity extends Equatable {
  final String id;
  final String company;
  final String from;
  final String to;
  final String departureTime;
  final String arrivalTime;
  final String duration;
  final double price;
  final String? seatNumber;
  final TransportType transportType;
  final TripType tripType;

  const TripResultEntity({
    required this.id,
    required this.company,
    required this.from,
    required this.to,
    required this.departureTime,
    required this.arrivalTime,
    required this.duration,
    required this.price,
    required this.transportType,
    required this.tripType,
    this.seatNumber,
  });

  @override
  List<Object?> get props => [
    id,
    company,
    from,
    to,
    departureTime,
    arrivalTime,
    duration,
    price,
    seatNumber,
    transportType,
    tripType,
  ];
}
