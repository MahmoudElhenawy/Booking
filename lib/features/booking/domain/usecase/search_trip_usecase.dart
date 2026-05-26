import 'package:booking_app/features/booking/domain/entities/trip_result_entity.dart';
import 'package:booking_app/features/booking/domain/entities/trip_search_params.dart';
import 'package:booking_app/features/booking/domain/repositories/booking_repository.dart';

class SearchTripsUseCase {
  final BookingRepository repository;

  SearchTripsUseCase(this.repository);

  Future<List<TripResultEntity>> call(TripSearchParams params) {
    return repository.searchTrips(params);
  }
}
