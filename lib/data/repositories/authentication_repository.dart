import 'package:ecommerce_final_year_project/features/authentication/screens/login/login.dart';
import 'package:ecommerce_final_year_project/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();

  @override
  void onReady() {
    super.onReady();
    FlutterNativeSplash.remove();

    // Delay navigation until GetMaterialApp is ready
    WidgetsBinding.instance.addPostFrameCallback((_) {
      screenRedirect();
    });
  }

  void screenRedirect() async {
    deviceStorage.writeIfNull('isFirstTime', true);

    final isFirstTime = deviceStorage.read('isFirstTime');

    if (kDebugMode) {
      print("=============== GetStorage =============");
      print("isFirstTime: $isFirstTime");
    }

    if (isFirstTime == true) {
      Get.offAll(() => const Onboarding());
    } else {
      Get.offAll(() => const LoginScreen());
    }
  }
}
