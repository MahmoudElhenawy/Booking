import 'package:booking_app/features/booking/presentation/widgets/transport_tab_item.dart';
import 'package:booking_app/features/booking/presentation/controller/cubit/booking_cubit.dart';
import 'package:booking_app/features/booking/presentation/controller/cubit/booking_state.dart';
import 'package:booking_app/features/booking/domain/entities/transport_type.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransportTabs extends StatelessWidget {
  const TransportTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: TransportTabItem(
                title: "bus".tr(),
                icon: Icons.directions_bus,
                isSelected: state.selectedTransport == TransportType.bus,
                onTap: () => context.read<BookingCubit>().selectTransport(
                  TransportType.bus,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TransportTabItem(
                title: "train".tr(),
                icon: Icons.train,
                isSelected: state.selectedTransport == TransportType.train,
                onTap: () => context.read<BookingCubit>().selectTransport(
                  TransportType.train,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TransportTabItem(
                title: "flight".tr(),
                icon: Icons.flight,
                isSelected: state.selectedTransport == TransportType.flight,
                onTap: () => context.read<BookingCubit>().selectTransport(
                  TransportType.flight,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
