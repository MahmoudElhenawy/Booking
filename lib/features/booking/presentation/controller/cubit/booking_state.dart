import 'package:booking_app/features/booking/domain/entities/transport_type.dart';
import 'package:booking_app/features/booking/domain/entities/trip_entity.dart';
import 'package:booking_app/features/booking/domain/entities/trip_result_entity.dart';
import 'package:booking_app/features/booking/domain/entities/trip_type.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum TripsStatus { initial, loading, loaded, error }

class BookingState extends Equatable {
  final TransportType selectedTransport;
  final TripType selectedTripType;
  final TripsStatus trendingStatus;
  final TripsStatus searchStatus;
  final List<TripEntity> trendingTrips;
  final List<TripResultEntity> searchResults;
  final String? trendingErrorMessage;
  final String? searchErrorMessage;
  final String selectedFrom;
  final String selectedTo;
  final int selectedTravelers;
  final DateTime? selectedDate;
  final TimeOfDay? selectedTime;

  const BookingState({
    required this.selectedTransport,
    required this.selectedTripType,
    required this.trendingStatus,
    required this.searchStatus,
    required this.trendingTrips,
    required this.searchResults,
    required this.selectedFrom,
    required this.selectedTo,
    required this.selectedTravelers,
    this.selectedDate,
    this.selectedTime,
    this.trendingErrorMessage,
    this.searchErrorMessage,
  });

  factory BookingState.initial() {
    return const BookingState(
      selectedTransport: TransportType.bus,
      selectedTripType: TripType.oneWay,
      trendingStatus: TripsStatus.initial,
      searchStatus: TripsStatus.initial,
      trendingTrips: [],
      searchResults: [],
      selectedFrom: 'cairo_eg',
      selectedTo: 'alexandria_eg',
      selectedTravelers: 1,
    );
  }

  BookingState copyWith({
    TransportType? selectedTransport,
    TripType? selectedTripType,
    TripsStatus? trendingStatus,
    TripsStatus? searchStatus,
    List<TripEntity>? trendingTrips,
    List<TripResultEntity>? searchResults,
    String? trendingErrorMessage,
    String? searchErrorMessage,
    String? selectedFrom,
    String? selectedTo,
    int? selectedTravelers,
    DateTime? selectedDate,
    TimeOfDay? selectedTime,
    bool clearTrendingError = false,
    bool clearSearchError = false,
  }) {
    return BookingState(
      selectedTransport: selectedTransport ?? this.selectedTransport,
      selectedTripType: selectedTripType ?? this.selectedTripType,
      trendingStatus: trendingStatus ?? this.trendingStatus,
      searchStatus: searchStatus ?? this.searchStatus,
      trendingTrips: trendingTrips ?? this.trendingTrips,
      searchResults: searchResults ?? this.searchResults,
      selectedFrom: selectedFrom ?? this.selectedFrom,
      selectedTo: selectedTo ?? this.selectedTo,
      selectedTravelers: selectedTravelers ?? this.selectedTravelers,
      selectedDate: selectedDate ?? this.selectedDate,
      selectedTime: selectedTime ?? this.selectedTime,
      trendingErrorMessage: clearTrendingError
          ? null
          : (trendingErrorMessage ?? this.trendingErrorMessage),
      searchErrorMessage: clearSearchError
          ? null
          : (searchErrorMessage ?? this.searchErrorMessage),
    );
  }

  @override
  List<Object?> get props => [
    selectedTransport,
    selectedTripType,
    trendingStatus,
    searchStatus,
    trendingTrips,
    searchResults,
    trendingErrorMessage,
    searchErrorMessage,
    selectedFrom,
    selectedTo,
    selectedTravelers,
    selectedDate,
    selectedTime,
  ];
}
