import 'package:booking_app/features/booking/domain/entities/trip_entity.dart';
import 'package:booking_app/features/booking/domain/entities/trip_result_entity.dart';
import 'package:booking_app/features/booking/domain/entities/trip_search_params.dart';

abstract class BookingRepository {
  Future<List<TripEntity>> getTrendingTrips();
  Future<List<TripResultEntity>> searchTrips(TripSearchParams params);
}
