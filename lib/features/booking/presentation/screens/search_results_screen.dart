import 'package:booking_app/core/router/app_router.dart';
import 'package:booking_app/core/utils/app_assets.dart';
import 'package:booking_app/core/utils/app_colors.dart';
import 'package:booking_app/core/utils/app_styels.dart';
import 'package:booking_app/core/widgets/custom_button.dart';
import 'package:booking_app/features/booking/presentation/controller/cubit/booking_cubit.dart';
import 'package:booking_app/features/booking/presentation/controller/cubit/booking_state.dart';
import 'package:booking_app/features/booking/presentation/model/search_results_args.dart';
import 'package:booking_app/features/booking/presentation/widgets/results_list.dart';
import 'package:booking_app/features/booking/presentation/widgets/search_summary_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';

class SearchResultsScreen extends StatelessWidget {
  final SearchResultsArgs? summary;

  const SearchResultsScreen({super.key, this.summary});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<BookingCubit, BookingState>(
            builder: (context, state) {
              final args =
                  summary ??
                  SearchResultsArgs(
                    transportType: state.selectedTransport,
                    tripType: state.selectedTripType,
                    from: state.selectedFrom,
                    to: state.selectedTo,
                    date: state.selectedDate,
                    time: state.selectedTime,
                    travelers: state.selectedTravelers,
                  );

              return Column(
                children: [
                  const SizedBox(height: 16),

                  SearchSummaryCard(summary: args),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "available_tickets".tr(),
                        style: AppTextStyles.title.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const ResultsList(),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomButton(
                      text: 'back_to_search'.tr(),
                      onPressed: () => context.go(AppRouter.homeScreen),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Image.asset(
                    color: AppColors.primary,
                    AssetsData.logo,
                    width: 200,
                    height: 200,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
