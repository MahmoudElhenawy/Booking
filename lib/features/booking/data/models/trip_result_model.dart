import 'package:booking_app/features/booking/domain/entities/trip_result_entity.dart';

class TripResultModel extends TripResultEntity {
  const TripResultModel({
    required super.id,
    required super.company,
    required super.from,
    required super.to,
    required super.departureTime,
    required super.arrivalTime,
    required super.duration,
    required super.price,
    required super.transportType,
    required super.tripType,
    super.seatNumber,
  });
}
