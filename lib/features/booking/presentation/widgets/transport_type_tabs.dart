import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class TransportTypeTabs extends StatelessWidget {
  const TransportTypeTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildItem(icon: Icons.directions_bus, title: "Bus", isSelected: true),

        const SizedBox(width: 10),

        _buildItem(icon: Icons.train, title: "Train"),

        const SizedBox(width: 10),

        _buildItem(icon: Icons.flight, title: "Flight"),
      ],
    );
  }

  Widget _buildItem({
    required IconData icon,
    required String title,
    bool isSelected = false,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),

        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.grey.shade200,

          borderRadius: BorderRadius.circular(16),
        ),

        child: Column(
          children: [
            Icon(icon, color: isSelected ? Colors.white : Colors.black54),

            const SizedBox(height: 6),

            Text(
              title,

              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
