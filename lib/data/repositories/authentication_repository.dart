import 'package:ecommerce_final_year_project/features/authentication/screens/login/login.dart';
import 'package:ecommerce_final_year_project/features/authentication/screens/onboarding/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  void screenRedirect() {
    deviceStorage.writeIfNull('isFirstTime', true);
    final isFirstTime = deviceStorage.read('isFirstTime');

    if (isFirstTime == true) {
      Get.offAll(() => const Onboarding());
    } else {
      Get.offAll(() => const LoginScreen());
    }
  }

  /*------------------ Email & Password Register ------------------*/
  Future<UserCredential> createWithEmailPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'Authentication error';
    } on FirebaseException catch (e) {
      throw e.message ?? 'Firebase error';
    } on PlatformException catch (e) {
      throw e.message ?? 'Platform error';
    } on FormatException {
      throw 'Invalid format';
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
