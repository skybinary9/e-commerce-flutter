import 'package:ecommerce_final_year_project/features/authentication/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  final PageController pageController = PageController();
  RxInt currentIndex = 0.obs;

  void updatePageIndicator(int index) {
    currentIndex.value = index;
  }

  void dotNavigationClick(int index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }

  void nextPage() {
  if (currentIndex.value < 2) {
    pageController.jumpToPage(currentIndex.value + 1);
  } else {
    final storage = GetStorage();
    storage.write('isFirstTime', false);
    Get.offAll(() => const LoginScreen());
  }
}


 void skipPage() {
  final storage = GetStorage();
  storage.write('isFirstTime', false);

  Get.offAll(() => const LoginScreen());
}
}
