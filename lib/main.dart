import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animal/splash_screen.dart';
import 'package:animal/theme/app_theme.dart';

void main() {
  runApp(const AnimalBiographyApp());
}

class AnimalBiographyApp extends StatelessWidget {
  const AnimalBiographyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animal Biography',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppTheme.primaryBrown,
        scaffoldBackgroundColor: AppTheme.backgroundBrown,
        textTheme: GoogleFonts.poppinsTextTheme(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryBrown,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      home: SplashScreen(),
    );
  }
}
