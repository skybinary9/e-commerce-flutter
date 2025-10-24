import 'package:flutter/material.dart';

class MegamartChipTheme{
  MegamartChipTheme._();
  
  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withValues(alpha: 0.5),
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: Colors.deepOrange,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: Colors.white,
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withValues(alpha: 0.5),
    labelStyle: const TextStyle(color: Colors.white),
    selectedColor: Colors.deepOrange,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: Colors.white,
  );





}