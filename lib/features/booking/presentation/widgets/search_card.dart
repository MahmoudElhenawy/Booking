import 'package:booking_app/core/widgets/custom_button.dart';
import 'package:booking_app/features/booking/presentation/widgets/date_field.dart';
import 'package:booking_app/features/booking/presentation/widgets/from_to_section.dart';
import 'package:booking_app/features/booking/presentation/widgets/time_field.dart';
import 'package:booking_app/features/booking/presentation/widgets/transport_tabs.dart';
import 'package:booking_app/features/booking/presentation/widgets/trip_type_selector.dart';
import 'package:booking_app/features/booking/presentation/widgets/travelers_field.dart';
import 'package:booking_app/features/booking/presentation/controller/cubit/booking_cubit.dart';
import 'package:booking_app/features/booking/presentation/controller/cubit/booking_state.dart';
import 'package:booking_app/features/booking/presentation/model/search_results_args.dart';
import 'package:booking_app/core/router/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(24),

        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 10),
        ],
      ),

      child: Column(
        children: [
          const TransportTabs(),

          SizedBox(height: 24),

          const FromToSection(),

          SizedBox(height: 16),

          const TripTypeSelector(),

          SizedBox(height: 16),

          DateField(),

          SizedBox(height: 16),

          const TimeField(),

          SizedBox(height: 16),

          TravelersField(),

          SizedBox(height: 24),

          BlocBuilder<BookingCubit, BookingState>(
            builder: (context, state) {
              final isLoading = state.searchStatus == TripsStatus.loading;
              final cubit = context.read<BookingCubit>();

              return CustomButton(
                text: isLoading ? "loading".tr() : "search".tr(),
                onPressed: isLoading
                    ? null
                    : () {
                        final args = SearchResultsArgs(
                          transportType: state.selectedTransport,
                          tripType: state.selectedTripType,
                          from: state.selectedFrom,
                          to: state.selectedTo,
                          date: state.selectedDate,
                          time: state.selectedTime,
                          travelers: state.selectedTravelers,
                        );

                        cubit.searchTrips();

                        context.go(AppRouter.searchResults, extra: args);
                      },
              );
            },
          ),
        ],
      ),
    );
  }
}
