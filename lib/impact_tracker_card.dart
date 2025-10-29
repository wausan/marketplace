// FILE: widgets/impact_tracker_card.dart (Corrected)

import 'package:flutter/material.dart';

class ImpactTrackerCard extends StatelessWidget {
  // ✅ FIX: Added a constructor to accept the kgsPrevented value.
  final double kgsPrevented;
  const ImpactTrackerCard({super.key, required this.kgsPrevented});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: Row(
          children: [
            const Icon(Icons.landscape_outlined, color: Colors.green, size: 40),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Landfill Prevented",
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                const SizedBox(height: 4),
                TweenAnimationBuilder<double>(
                  // ✅ FIX: The animation now uses the value passed into the widget.
                  tween: Tween<double>(begin: kgsPrevented - 2.5, end: kgsPrevented),
                  duration: const Duration(milliseconds: 1500),
                  builder: (context, value, child) {
                    return Text(
                      "${value.toStringAsFixed(1)} KGS",
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}