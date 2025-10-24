import 'package:flutter/material.dart';

class MegamartTextfiledTheme{
  MegamartTextfiledTheme._();

  static InputDecorationTheme lightTextField =InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    labelStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.black), 
    hintStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: Colors.black.withValues(alpha: .5)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14), 
      borderSide:BorderSide(width: 1, color: Colors.grey),),

    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14), 
      borderSide:BorderSide(width: 1, color: Colors.grey),),

    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14), 
      borderSide:BorderSide(width: 1, color: Colors.black12),),

    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14), 
      borderSide:BorderSide(width: 1, color: Colors.red),),

    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14), 
      borderSide:BorderSide(width: 2, color: Colors.orange),),

  );


  static InputDecorationTheme darkTextField =InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    labelStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.white), 
    hintStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.white),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: Colors.white.withValues(alpha: .5)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14), 
      borderSide:BorderSide(width: 1, color: Colors.grey),),

    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14), 
      borderSide:BorderSide(width: 1, color: Colors.grey),),

    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14), 
      borderSide:BorderSide(width: 1, color: Colors.white),),

    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14), 
      borderSide:BorderSide(width: 1, color: Colors.red),),

    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14), 
      borderSide:BorderSide(width: 2, color: Colors.orange),),
  );
  
}