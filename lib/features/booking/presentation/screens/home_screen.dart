import 'package:booking_app/features/booking/presentation/widgets/home_header.dart';
import 'package:booking_app/features/booking/presentation/widgets/search_card.dart';
import 'package:booking_app/features/booking/presentation/widgets/trending_places_section.dart';
import 'package:booking_app/features/booking/presentation/widgets/trips_list.dart';
import 'package:booking_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              HomeHeader(),
              SizedBox(height: 20),
              SearchCard(),
              SizedBox(height: 30),
              TripsList(),
              SizedBox(height: 30),
              TrendingPlacesSection(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
