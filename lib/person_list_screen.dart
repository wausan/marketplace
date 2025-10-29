import 'package:flutter/material.dart';

class PersonListScreen extends StatelessWidget {
  const PersonListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Individuals in Need")),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Text("Feature coming soon! This section will show a list of verified individuals who need electronic devices.", textAlign: TextAlign.center),
        ),
      ),
    );
  }
}