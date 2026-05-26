import 'package:booking_app/features/booking/domain/entities/trip_entity.dart';

class TripModel extends TripEntity {
  const TripModel({
    required super.id,
    required super.city,
    required super.country,
    required super.image,
    required super.price,
  });
}
