import 'package:ecommerce_final_year_project/features/authentication/screens/login/login.dart';
import 'package:ecommerce_final_year_project/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();

  @override
  void onReady() {
    super.onReady();
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // Redirect Based on First-Time Use
  void screenRedirect() async {
    // Set default value one time only
    deviceStorage.writeIfNull('isFirstTime', true);

    final isFirstTime = deviceStorage.read('isFirstTime');

    if (kDebugMode) {
      print("=============== GetStorage =============");
      print("isFirstTime: $isFirstTime");
    }

    // Correct logic:
    // First time → Onboarding
    // Next time → Login
    if (isFirstTime == true) {
      Get.offAll(() => const Onboarding());
    } else {
      Get.offAll(() => const LoginScreen());
    }
  }
}
