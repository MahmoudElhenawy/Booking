import 'package:booking_app/features/booking/domain/entities/trip_entity.dart';
import 'package:booking_app/features/booking/domain/repositories/booking_repository.dart';

class GetTrendingTripsUseCase {
  final BookingRepository repository;

  GetTrendingTripsUseCase(this.repository);

  Future<List<TripEntity>> call() {
    return repository.getTrendingTrips();
  }
}
