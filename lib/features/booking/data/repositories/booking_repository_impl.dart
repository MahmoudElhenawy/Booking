import 'package:booking_app/features/booking/data/datasource/dummy_trips.dart';
import 'package:booking_app/features/booking/domain/entities/trip_entity.dart';
import 'package:booking_app/features/booking/domain/entities/trip_result_entity.dart';
import 'package:booking_app/features/booking/domain/repositories/booking_repository.dart';
import 'package:booking_app/features/booking/domain/entities/trip_search_params.dart';

class BookingRepositoryImpl implements BookingRepository {
  final DummyTripsDataSource dataSource;

  BookingRepositoryImpl(this.dataSource);

  @override
  Future<List<TripEntity>> getTrendingTrips() {
    return dataSource.fetchTrendingTrips();
  }

  @override
  Future<List<TripResultEntity>> searchTrips(TripSearchParams params) {
    return dataSource.searchTrips(params);
  }
}
