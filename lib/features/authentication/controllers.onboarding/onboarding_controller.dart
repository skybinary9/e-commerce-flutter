import 'package:ecommerce_final_year_project/features/authentication/screens/login/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  // Page Controller
  final PageController pageController = PageController();

  // Observable current index
  RxInt currentIndex = 0.obs;

  // Update current index when page changes
  void updatePageIndicator(int index) {
    currentIndex.value = index;
  }

  // Dot navigation
  void dotNavigationClick(int index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }

  // Go to next page
  void nextPage() {
    final storage = GetStorage();

    if (kDebugMode) {
      print('=============== GetStorage Next Button =============');
      print("isFirstTime: ${storage.read('isFirstTime')}");
    }

    // Save onboarding completion
    storage.write('isFirstTime', false);

    if (currentIndex.value < 2) {
      pageController.jumpToPage(currentIndex.value + 1);
    } else {
      Get.off(() => LoginScreen());
    }
  }

  // Skip onboarding completely
  void skipPage() {
    currentIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
