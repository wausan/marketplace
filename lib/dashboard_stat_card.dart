// FILE: dashboard_stat_card.dart (Corrected)

import 'package:flutter/material.dart';

class DashboardStatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const DashboardStatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    // This logic checks if the value contains the '₱' sign and replaces it.
    final displayValue = value.contains('₱')
        ? value.replaceAll('₱', '\u20B1')
        : value;

    return Card(
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, color: Colors.green, size: 28),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ✅ FIX: The logic above ensures the Unicode character is used here.
                Text(displayValue, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(title, style: TextStyle(fontSize: 14, color: Colors.grey[400])),
              ],
            ),
          ],
        ),
      ),
    );
  }
}