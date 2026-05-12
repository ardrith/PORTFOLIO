import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Pure 8-Bit Dark Arcade Theme
  static const Color background = Color(0xFF000000); 
  static const Color surface = Color(0xFF000000); 
  static const Color primaryNeon = Color(0xFFFF0055); // Arcade Red/Pink
  static const Color secondaryNeon = Color(0xFF00FFCC); // Arcade Cyan
  static const Color ternaryNeon = Color(0xFFFFCC00); // Arcade Yellow
  static const Color textPrimary = Color(0xFFFFFFFF); // White text
  static const Color textSecondary = Color(0xFFCCCCCC); // Gray text
  static const Color border = Color(0xFF444444); // Chunky border color

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: background,
      primaryColor: primaryNeon,
      colorScheme: const ColorScheme.dark(
        primary: primaryNeon,
        secondary: secondaryNeon,
        surface: surface,
        background: background,
      ),
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.vt323(color: textPrimary, fontSize: 24),
        bodyMedium: GoogleFonts.vt323(color: textSecondary, fontSize: 20),
        bodySmall: GoogleFonts.vt323(color: textSecondary, fontSize: 16),
        displayLarge: GoogleFonts.vt323(color: textPrimary, fontSize: 48),
        displaySmall: GoogleFonts.vt323(color: textPrimary, fontSize: 32),
        titleLarge: GoogleFonts.vt323(color: textPrimary, fontSize: 28),
      ),
    );
  }
}
