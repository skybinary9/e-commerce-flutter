import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MegamartDeviceUtility {
  // Hide keyboard
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  } 
  // Set status bar color
  
  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );

  }
  // Check if device is in landscape orientation

  static bool isLandscapeOrientation(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets;
    return viewInsets.bottom ==0;
  }
  // Check if device is in portrait orientation

  static bool isPortraitOrientation(BuildContext context){
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom != 0;

  }
  // Set full screen mode

  static void setFullScreen(bool enable){
    SystemChrome.setEnabledSystemUIMode(enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);

  }
  // Get screen height

  static double getScreenHeight(BuildContext context){
    return MediaQuery.of(Get.context!).devicePixelRatio;
  }
  // Get screen width

  static double getScreenwidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
  // Get device pixel ratio

  static double getPixelRation(BuildContext context){
    return MediaQuery.of(Get.context!).devicePixelRatio;
  }
  // Get status bar height

  static double getStatusbarHeight(BuildContext context){
    return MediaQuery.of(Get.context!).padding.top;
  }
  // Get bottom navigation bar height

  static double getBottomNavigationBarHeigjht(){
    return kBottomNavigationBarHeight;
  }
  // Get app bar height

  
  static double getappBarHeight(){
    return kToolbarHeight;
  }   
  // Get keyboard height

  static double getKeyboardHeight(){
    final viewInsets = MediaQuery.of(Get.context!).viewInsets;
    return viewInsets.bottom;
  }
  // Check if keyboard is visible

  static Future<bool> isKeyboardVisible() async{
     final viewInsets = MediaQuery.of(Get.context!).viewInsets;
    return viewInsets.bottom >0;

  }
  // Check if the device is physical or emulator

  static Future<bool> isPhysicalDevice()async{
    return defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS;

  }
  // Trigger device vibration

  static void vibrate(Duration duration){
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }
  // Set preferred device orientations

  static Future<void> setPreferredOrientation(List<DeviceOrientation> orientations) async{
    await SystemChrome.setPreferredOrientations(orientations);
  }
  // Hide status bar

  static void hideStatusBar(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  // Show status bar

  static void showStatusBar(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
  }
  // Check for internet connectivity

  static Future<bool> hasInternetConnection() async{
    try{
      final result = await InternetAddress.lookup("example.com");
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
      
    }on SocketException catch(_){
      return false;
    }

  }
  // Check if the platform is iOS

  static bool isIOS(){
    return Platform.isIOS;
  }
  // Check if the platform is Android

  static bool isAndroid(){
    return Platform.isAndroid;
  }


  // Launch URL in default browser

  static void launchUrl(String url) async{
    if (await canLaunchUrlString(url)){
      await launchUrlString(url);

    }else{
      throw 'Could not Launch $url';
    }
  }


}
