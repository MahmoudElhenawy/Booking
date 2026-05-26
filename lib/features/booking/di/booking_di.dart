import 'package:booking_app/features/booking/data/datasource/dummy_trips.dart';
import 'package:booking_app/features/booking/data/repositories/booking_repository_impl.dart';
import 'package:booking_app/features/booking/domain/repositories/booking_repository.dart';
import 'package:booking_app/features/booking/domain/usecase/get_trending_trips_usecase.dart';
import 'package:booking_app/features/booking/domain/usecase/search_trip_usecase.dart';
import 'package:booking_app/features/booking/presentation/controller/cubit/booking_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void initBookingDependencies() {
  if (getIt.isRegistered<BookingCubit>()) {
    return;
  }

  getIt
    ..registerLazySingleton<DummyTripsDataSource>(DummyTripsDataSource.new)
    ..registerLazySingleton<BookingRepository>(
      () => BookingRepositoryImpl(getIt<DummyTripsDataSource>()),
    )
    ..registerLazySingleton<GetTrendingTripsUseCase>(
      () => GetTrendingTripsUseCase(getIt<BookingRepository>()),
    )
    ..registerLazySingleton<SearchTripsUseCase>(
      () => SearchTripsUseCase(getIt<BookingRepository>()),
    )
    ..registerLazySingleton<BookingCubit>(
      () => BookingCubit(
        getTrendingTripsUseCase: getIt<GetTrendingTripsUseCase>(),
        searchTripsUseCase: getIt<SearchTripsUseCase>(),
      ),
    );
}
