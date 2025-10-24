import 'package:flutter/material.dart';

class MegamartColors {
  MegamartColors._(); // private constructor

  // 🔸 App Basic Colors
  static const Color primary = Color(0xFFFF5722); // Deep Orange
  static const Color secondary = Color(0xFF009688); // Teal
  static const Color accent = Color(0xFFFFC107); // Amber (Accent/Highlight)

  // 🔸 Gradient Colors
  static const Gradient linearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFF7043), // lighter deep orange
      Color(0xFFFF5722), // base deep orange
      Color(0xFF009688), // teal
    ],
  );

  // 🔸 Text Colors
  static const Color textPrimary = Color(0xFF333333); // main dark text
  static const Color textSecondary = Color(0xFF6C757D); // muted gray
  static const Color textWhite = Colors.white; // white text

  // 🔸 Background Colors
  static const Color light = Color(0xFFF6F6F6); // light bg
  static const Color dark = Color(0xFF272727); // dark bg
  static const Color primaryBackground = Color(0xFFF3F5FF); // soft bluish tint bg

  // 🔸 Container Background Colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color get darkContainer => Colors.white.withValues(alpha: 0.1);

  // 🔸 Button Colors
  static const Color primaryButton = Color(0xFFFF5722); // Deep orange button
  static const Color secondaryButton = Color(0xFF009688); // Teal button
  static const Color disableButton = Color(0xFFC4C4C4); // Disabled/gray button

  // 🔸 Border Colors
  static const Color primaryBorder = Color(0xFFD9D9D9);
  static const Color secondaryBorder = Color(0xFFE6E6E6);

  // 🔸 Error & Validation Colors
  static const Color error = Color(0xFFD32F2F); // red
  static const Color success = Color(0xFF388E3C); // green
  static const Color warning = Color(0xFFFFA000); // amber
  static const Color info = Color(0xFF1976D2); // blue

  // 🔸 Neutral Shades
  static const Color black = Color(0xFF000000);
  static const Color darkerGray = Color(0xFF212121);
  static const Color darkGray = Color(0xFF424242);
  static const Color dGray = Color(0xFF616161);
  static const Color softGray = Color(0xFF9E9E9E);
  static const Color lightGray = Color(0xFFBDBDBD);
  static const Color white = Color(0xFFFFFFFF);
}
