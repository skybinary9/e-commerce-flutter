import 'package:ecommerce_final_year_project/utils/theme/custom_theme/appbar_theme.dart';
import 'package:ecommerce_final_year_project/utils/theme/custom_theme/bottom_sheet_theme.dart';
import 'package:ecommerce_final_year_project/utils/theme/custom_theme/checkbox_theme.dart';
import 'package:ecommerce_final_year_project/utils/theme/custom_theme/chip_theme.dart';
import 'package:ecommerce_final_year_project/utils/theme/custom_theme/elevated_button_theme.dart';
import 'package:ecommerce_final_year_project/utils/theme/custom_theme/outline_button_theme.dart';
import 'package:ecommerce_final_year_project/utils/theme/custom_theme/text_theme.dart';
import 'package:ecommerce_final_year_project/utils/theme/custom_theme/textfield_theme.dart';
import 'package:flutter/material.dart';


class MegamartTheme{
  MegamartTheme._();

  static ThemeData lighTheme =ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.deepOrange, 
    scaffoldBackgroundColor: Colors.white,
    textTheme: MegamartTextTheme.lighTextTheme,
    elevatedButtonTheme: MegamartButtonTheme.lightElevatedButton,
    chipTheme: MegamartChipTheme.lightChipTheme,
    checkboxTheme: MegamartCheckboxTheme.lightCheckboxTheme,
    appBarTheme: MegaMartAppbarTheme.lightAppBarTheme,
    bottomSheetTheme: MegamartBottomSheetTheme.lightbottomsheetthemedata,
    outlinedButtonTheme: MegamartOutlineTheme.lightOutlineButtonTheme,
    inputDecorationTheme: MegamartTextfiledTheme.lightTextField,
    );
  static ThemeData darkTheme =ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.deepOrange, 
    scaffoldBackgroundColor: Colors.black,
    textTheme: MegamartTextTheme.darkTextTheme,
    elevatedButtonTheme: MegamartButtonTheme.darkElevatedButton,
    chipTheme: MegamartChipTheme.darkChipTheme,
    checkboxTheme: MegamartCheckboxTheme.darkCheckboxTheme,
    appBarTheme: MegaMartAppbarTheme.darkAppBarTheme,
    bottomSheetTheme: MegamartBottomSheetTheme.darktbottomsheetthemedata,
    outlinedButtonTheme: MegamartOutlineTheme.darkOutlineButtonTheme,
    inputDecorationTheme: MegamartTextfiledTheme.darkTextField,

  );


}