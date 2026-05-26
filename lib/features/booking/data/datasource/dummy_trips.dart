import 'package:booking_app/core/utils/app_assets.dart';
import 'package:booking_app/features/booking/data/models/trip_model.dart';
import 'package:booking_app/features/booking/data/models/trip_result_model.dart';
import 'package:booking_app/features/booking/domain/entities/transport_type.dart';
import 'package:booking_app/features/booking/domain/entities/trip_type.dart';
import 'package:booking_app/features/booking/domain/entities/trip_search_params.dart';

class DummyTripsDataSource {
  Future<List<TripModel>> fetchTrendingTrips() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return const [
      TripModel(
        id: '1',
        city: 'Paris',
        country: 'FR',
        image: AssetsData.trending1,
        price: 45,
      ),
      TripModel(
        id: '2',
        city: 'Tokyo',
        country: 'JP',
        image: AssetsData.trending2,
        price: 82,
      ),
    ];
  }

  Future<List<TripResultModel>> searchTrips(TripSearchParams params) async {
    await Future.delayed(const Duration(milliseconds: 800));

    final List<TripResultModel> trips = const [
      TripResultModel(
        id: 't1',
        company: 'Skyline Air',
        from: 'cairo_eg',
        to: 'istanbul_tr',
        departureTime: '08:20',
        arrivalTime: '11:10',
        duration: '2h 50m',
        price: 140,
        seatNumber: '12A',
        transportType: TransportType.flight,
        tripType: TripType.oneWay,
      ),
      TripResultModel(
        id: 't2',
        company: 'BlueRail',
        from: 'cairo_eg',
        to: 'alexandria_eg',
        departureTime: '09:30',
        arrivalTime: '11:00',
        duration: '1h 30m',
        price: 18,
        seatNumber: 'B4',
        transportType: TransportType.train,
        tripType: TripType.oneWay,
      ),
      TripResultModel(
        id: 't3',
        company: 'Nile Bus Lines',
        from: 'cairo_eg',
        to: 'alexandria_eg',
        departureTime: '12:15',
        arrivalTime: '15:10',
        duration: '2h 55m',
        price: 10,
        seatNumber: '21C',
        transportType: TransportType.bus,
        tripType: TripType.oneWay,
      ),
      TripResultModel(
        id: 't4',
        company: 'Express Rail',
        from: 'alexandria_eg',
        to: 'cairo_eg',
        departureTime: '17:40',
        arrivalTime: '19:05',
        duration: '1h 25m',
        price: 22,
        seatNumber: 'A1',
        transportType: TransportType.train,
        tripType: TripType.roundTrip,
      ),
      TripResultModel(
        id: 't5',
        company: 'Mediterranean Air',
        from: 'dubai_ae',
        to: 'paris_fr',
        departureTime: '06:50',
        arrivalTime: '12:30',
        duration: '5h 40m',
        price: 220,
        seatNumber: null,
        transportType: TransportType.flight,
        tripType: TripType.oneWay,
      ),
      TripResultModel(
        id: 't6',
        company: 'Intercity Coach',
        from: 'rome_it',
        to: 'milan_it',
        departureTime: '14:05',
        arrivalTime: '18:00',
        duration: '3h 55m',
        price: 24,
        seatNumber: '18D',
        transportType: TransportType.bus,
        tripType: TripType.roundTrip,
      ),
    ];

    return trips.where((trip) {
      final matchesFrom = trip.from == params.from;
      final matchesTo = trip.to == params.to;
      final matchesTransport = trip.transportType == params.transportType;
      final matchesTripType = trip.tripType == params.tripType;

      return matchesFrom && matchesTo && matchesTransport && matchesTripType;
    }).toList();
  }
}
