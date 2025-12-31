import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:ecommerce_final_year_project/utils/popups/screen_loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EAppScreenLoader {

  /// Opens a full-screen loading dialog
  static void openLoadingDialog(String text, String animation) {
  final context = Get.overlayContext;
  if (context == null) return;

  showDialog(
    context: context,
    barrierDismissible: false,
    
    builder: (_) => PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: HelperFunction.isDarkMode(context)
            ? MegamartColors.dark
            : MegamartColors.white,
        body: Center(
          child: EAppLoaderWidget(
            text: text,
            animation: animation,
          ),
        ),
      ),
    ),
  );
}

  /// Closes the loading dialog safely
  static void stopLoading() {
  final context = Get.overlayContext;
  if (context != null && Navigator.of(context).canPop()) {
    Navigator.of(context).pop();
  }
}

}
