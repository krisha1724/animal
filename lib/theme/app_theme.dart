import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Color Palette
  static const Color primaryBrown = Color(0xFF8B5E3C);
  static const Color lightBrown = Color(0xFFBE8C63);
  static const Color darkBrown = Color(0xFF4A3728);
  static const Color accentBrown = Color(0xFFD4A373);
  static const Color backgroundBrown = Color(0xFFF5E6D3);

  // Text Styles
  static TextStyle get headingStyle => GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: darkBrown,
  );

  static TextStyle get subheadingStyle => GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: primaryBrown,
  );

  static TextStyle get bodyStyle => GoogleFonts.poppins(
    fontSize: 14,
    color: darkBrown,
  );

  // Button Styles
  static ButtonStyle get primaryButtonStyle => ElevatedButton.styleFrom(
    backgroundColor: primaryBrown,
    foregroundColor: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  );

  // Card Decoration
  static BoxDecoration get cardDecoration => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: darkBrown.withOpacity(0.1),
        blurRadius: 10,
        offset: Offset(0, 4),
      ),
    ],
  );

  // Input Decoration
  static InputDecoration getInputDecoration(String label) => InputDecoration(
    labelText: label,
    labelStyle: TextStyle(color: primaryBrown),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: lightBrown),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: primaryBrown),
    ),
    fillColor: Colors.white,
    filled: true,
  );

  // Gradient Decoration
  static BoxDecoration get gradientDecoration => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.transparent,
        darkBrown.withOpacity(0.7),
      ],
    ),
  );
} 