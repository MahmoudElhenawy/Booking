import 'package:booking_app/features/booking/domain/usecase/get_trending_trips_usecase.dart';
import 'package:booking_app/features/booking/domain/usecase/search_trip_usecase.dart';
import 'package:booking_app/features/booking/domain/entities/trip_search_params.dart';
import 'package:booking_app/features/booking/domain/entities/transport_type.dart';
import 'package:booking_app/features/booking/domain/entities/trip_type.dart';
import 'package:booking_app/features/booking/presentation/controller/cubit/booking_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class BookingCubit extends Cubit<BookingState> {
  final GetTrendingTripsUseCase getTrendingTripsUseCase;
  final SearchTripsUseCase searchTripsUseCase;

  BookingCubit({
    required this.getTrendingTripsUseCase,
    required this.searchTripsUseCase,
  }) : super(BookingState.initial()) {
    loadTrendingTrips();
  }

  void selectTransport(TransportType transportType) {
    emit(state.copyWith(selectedTransport: transportType));
  }

  void selectTripType(TripType tripType) {
    emit(state.copyWith(selectedTripType: tripType));
  }

  void selectFrom(String from) {
    emit(state.copyWith(selectedFrom: from));
  }

  void selectTo(String to) {
    emit(state.copyWith(selectedTo: to));
  }

  void selectTravelers(int count) {
    emit(state.copyWith(selectedTravelers: count));
  }

  void selectDate(DateTime date) {
    emit(state.copyWith(selectedDate: date));
  }

  void selectTime(TimeOfDay time) {
    emit(state.copyWith(selectedTime: time));
  }

  Future<void> loadTrendingTrips() async {
    if (isClosed) {
      return;
    }

    emit(state.copyWith(trendingStatus: TripsStatus.loading));

    try {
      final trips = await getTrendingTripsUseCase();
      if (isClosed) {
        return;
      }
      emit(
        state.copyWith(
          trendingStatus: TripsStatus.loaded,
          trendingTrips: trips,
          clearTrendingError: true,
        ),
      );
    } catch (error) {
      if (isClosed) {
        return;
      }
      emit(
        state.copyWith(
          trendingStatus: TripsStatus.error,
          trendingErrorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> searchTrips() async {
    if (isClosed) {
      return;
    }

    emit(state.copyWith(searchStatus: TripsStatus.loading));

    try {
      final results = await searchTripsUseCase(
        TripSearchParams(
          from: state.selectedFrom,
          to: state.selectedTo,
          transportType: state.selectedTransport,
          tripType: state.selectedTripType,
          date: state.selectedDate,
          time: state.selectedTime,
        ),
      );

      if (isClosed) {
        return;
      }

      emit(
        state.copyWith(
          searchStatus: TripsStatus.loaded,
          searchResults: results,
          clearSearchError: true,
        ),
      );
    } catch (error) {
      if (isClosed) {
        return;
      }
      emit(
        state.copyWith(
          searchStatus: TripsStatus.error,
          searchErrorMessage: error.toString(),
        ),
      );
    }
  }
}
