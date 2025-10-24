import 'package:flutter/material.dart';

class MegamartButtonTheme{
  MegamartButtonTheme._();

  static final lightElevatedButton = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: Colors.deepOrange,
      disabledBackgroundColor: Colors.deepOrange.withValues(alpha: 0.4),
      disabledForegroundColor: Colors.white.withValues(alpha: 0.6),
      side: const BorderSide(color: Colors.deepOrange),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    )
  );
  static final darkElevatedButton = ElevatedButtonThemeData( style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: Colors.deepOrange,
      disabledBackgroundColor: Colors.deepOrange.withValues(alpha: 0.4),
      disabledForegroundColor: Colors.white.withValues(alpha: 0.6),
      side: const BorderSide(color: Colors.deepOrange),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ));
}
