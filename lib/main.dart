import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart'; // 🚀 UPDATE: For state management
import 'startup_screen.dart';
import 'animated_gradient_background.dart';
import 'listing_service.dart';
import 'user_service.dart'; // 🚀 UPDATE: User service
import 'impact_service.dart'; // 🚀 UPDATE: Impact service
import 'sample_data.dart';

void main() async {
  ListingService.instance.seed(sampleListings);
  runApp(
    // 🚀 UPDATE: Added providers for state management
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserService()),
        ChangeNotifierProvider(create: (context) => ImpactService()),
        ChangeNotifierProvider.value(value: ListingService.instance),
      ],
      child: const EcoByteApp(),
    ),
  );
}

class EcoByteApp extends StatelessWidget {
  const EcoByteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EcoByte',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Colors.transparent,
        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData.dark().textTheme,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      builder: (context, child) {
        return AnimatedGradientBackground(child: child!);
      },
      home: const StartupScreen(),
    );
  }
}
