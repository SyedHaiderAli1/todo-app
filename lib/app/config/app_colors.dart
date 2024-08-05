import 'package:flutter/material.dart';

class AppColors {
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color primary = Color(0xFF4EBC94);
  static const Color darkBlack = Color(0xFF1D1F1E);
  static const Color secondary = Color(0xFF1D1F1E);
  static const Color tertiaryOrange = Color(0xFFFC6404);
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color(0xFF002E94), // Start color
      Color(0xFF04256F), // End color
    ],
    begin: Alignment.centerLeft, // Gradient direction
    end: Alignment.centerRight,
  );
  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [
      secondary, // Start color
      tertiaryOrange, // End color
    ],
    begin: Alignment.topCenter, // Gradient direction
    end: Alignment.bottomCenter,
  );

  }