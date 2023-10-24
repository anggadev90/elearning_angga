import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = const Color(0xff4a56fe);
Color textColor = const Color(0xff1a1f2b);

ThemeData getDefaultTheme() {
  return ThemeData(
    primaryColor: primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0.0,
      titleTextStyle: GoogleFonts.roboto().copyWith(
        color: textColor,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: textColor,
      ),
    ),
    textTheme: TextTheme(
      bodySmall: GoogleFonts.roboto().copyWith(),
      bodyMedium: GoogleFonts.roboto().copyWith(),
      bodyLarge: GoogleFonts.roboto().copyWith(),
      displaySmall: GoogleFonts.roboto().copyWith(),
      displayMedium: GoogleFonts.roboto().copyWith(),
      displayLarge: GoogleFonts.roboto().copyWith(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(12.0),
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),
  );
}
