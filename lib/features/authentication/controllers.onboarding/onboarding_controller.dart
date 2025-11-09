import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  // Page controller
  final PageController pageController = PageController();

  // Current page index (observable)
  RxInt currentIndex = 0.obs;

  // Update current index when page scrolls
  void updatePageIndicator(int index) => currentIndex.value = index;

  // Handle dot navigation click
  void dotNavigationClick(int index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }

  // Go to next page
  void nextPage() {
    if (currentIndex.value < 2) {
      int nextPage = currentIndex.value + 1;
      pageController.jumpToPage(nextPage);
    } else {
      // When last page reached (you can navigate to LoginScreen here)
      // Get.to(LoginScreen());
    }
  }

  // Skip to last page
  void skipPage() {
    currentIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
