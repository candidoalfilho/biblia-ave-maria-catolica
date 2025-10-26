import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_constants.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: Color(AppConstants.primaryColorValue),
        secondary: Color(AppConstants.secondaryColorValue),
        surface: Color(AppConstants.backgroundColorValue),
        background: Color(AppConstants.backgroundColorValue),
        onPrimary: Colors.white,
        onSecondary: Colors.black87,
        onSurface: Colors.black87,
        onBackground: Colors.black87,
      ),
      textTheme: GoogleFonts.merriweatherTextTheme().copyWith(
        headlineLarge: GoogleFonts.merriweather(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: const Color(AppConstants.primaryColorValue),
        ),
        headlineMedium: GoogleFonts.merriweather(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: const Color(AppConstants.primaryColorValue),
        ),
        headlineSmall: GoogleFonts.merriweather(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: const Color(AppConstants.primaryColorValue),
        ),
        titleLarge: GoogleFonts.merriweather(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
        titleMedium: GoogleFonts.merriweather(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
        titleSmall: GoogleFonts.merriweather(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
        bodyLarge: GoogleFonts.merriweather(
          fontSize: 18,
          height: 1.6,
          color: Colors.black87,
        ),
        bodyMedium: GoogleFonts.merriweather(
          fontSize: 16,
          height: 1.5,
          color: Colors.black87,
        ),
        bodySmall: GoogleFonts.merriweather(
          fontSize: 14,
          height: 1.4,
          color: Colors.black54,
        ),
        labelLarge: GoogleFonts.notoSerif(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
        labelMedium: GoogleFonts.notoSerif(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
        labelSmall: GoogleFonts.notoSerif(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.black54,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(AppConstants.backgroundColorValue),
        foregroundColor: const Color(AppConstants.primaryColorValue),
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.merriweather(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: const Color(AppConstants.primaryColorValue),
        ),
      ),
      cardTheme: CardThemeData(
        elevation: AppConstants.cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
        color: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(AppConstants.primaryColorValue),
          foregroundColor: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.largePadding,
            vertical: AppConstants.defaultPadding,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(AppConstants.primaryColorValue),
          side: const BorderSide(
            color: Color(AppConstants.primaryColorValue),
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.largePadding,
            vertical: AppConstants.defaultPadding,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: const Color(AppConstants.primaryColorValue),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          ),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(AppConstants.backgroundColorValue),
        selectedItemColor: Color(AppConstants.primaryColorValue),
        unselectedItemColor: Colors.black54,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      dividerTheme: const DividerThemeData(
        color: Colors.black12,
        thickness: 1,
        space: 1,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: Color(AppConstants.accentColorValue),
        secondary: Color(AppConstants.secondaryColorValue),
        surface: Color(AppConstants.darkBackgroundColorValue),
        background: Color(AppConstants.darkBackgroundColorValue),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        onBackground: Colors.white,
      ),
      textTheme: GoogleFonts.merriweatherTextTheme(ThemeData.dark().textTheme).copyWith(
        headlineLarge: GoogleFonts.merriweather(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: const Color(AppConstants.accentColorValue),
        ),
        headlineMedium: GoogleFonts.merriweather(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: const Color(AppConstants.accentColorValue),
        ),
        headlineSmall: GoogleFonts.merriweather(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: const Color(AppConstants.accentColorValue),
        ),
        titleLarge: GoogleFonts.merriweather(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        titleMedium: GoogleFonts.merriweather(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        titleSmall: GoogleFonts.merriweather(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        bodyLarge: GoogleFonts.merriweather(
          fontSize: 18,
          height: 1.6,
          color: Colors.white,
        ),
        bodyMedium: GoogleFonts.merriweather(
          fontSize: 16,
          height: 1.5,
          color: Colors.white,
        ),
        bodySmall: GoogleFonts.merriweather(
          fontSize: 14,
          height: 1.4,
          color: Colors.white70,
        ),
        labelLarge: GoogleFonts.notoSerif(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        labelMedium: GoogleFonts.notoSerif(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        labelSmall: GoogleFonts.notoSerif(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.white70,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(AppConstants.darkBackgroundColorValue),
        foregroundColor: const Color(AppConstants.accentColorValue),
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.merriweather(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: const Color(AppConstants.accentColorValue),
        ),
      ),
      cardTheme: CardThemeData(
        elevation: AppConstants.cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
        color: const Color(0xFF3C3C3C),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(AppConstants.accentColorValue),
          foregroundColor: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.largePadding,
            vertical: AppConstants.defaultPadding,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(AppConstants.accentColorValue),
          side: const BorderSide(
            color: Color(AppConstants.accentColorValue),
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.largePadding,
            vertical: AppConstants.defaultPadding,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: const Color(AppConstants.accentColorValue),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          ),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(AppConstants.darkBackgroundColorValue),
        selectedItemColor: Color(AppConstants.accentColorValue),
        unselectedItemColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      dividerTheme: const DividerThemeData(
        color: Colors.white24,
        thickness: 1,
        space: 1,
      ),
    );
  }
}
