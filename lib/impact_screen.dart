// FILE: impact_screen.dart (Corrected)

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'impact_service.dart';
import 'impact_tracker_card.dart';
import 'school_list_screen.dart';
import 'person_list_screen.dart';
import 'page_transition.dart';

class ImpactScreen extends StatelessWidget {
  const ImpactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text("Your Impact"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // This part is now correct because ImpactTrackerCard can accept the parameter.
          Consumer<ImpactService>(
            builder: (context, impactService, child) {
              return ImpactTrackerCard(kgsPrevented: impactService.kgsPrevented);
            },
          ),
          const SizedBox(height: 24),
          Text(
            '"Every item you buy, sell, or donate prevents e-waste from entering landfills."',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.grey[400]),
          ),
          const SizedBox(height: 32),
          const Divider(color: Colors.grey),
          const SizedBox(height: 24),
          _buildDonationSection(context),
        ],
      ),
    );
  }

  Widget _buildDonationSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Donate Your E-Waste", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Card(
          child: ListTile(
            leading: const Icon(Icons.school_outlined, color: Colors.green),
            title: const Text("Donate to a School"),
            onTap: () => Navigator.of(context).push(FadeSlidePageRoute(page: const SchoolListScreen())),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.person_outline, color: Colors.green),
            title: const Text("Donate to an Individual"),
            onTap: () => Navigator.of(context).push(FadeSlidePageRoute(page: const PersonListScreen())),
          ),
        ),
      ],
    );
  }
}