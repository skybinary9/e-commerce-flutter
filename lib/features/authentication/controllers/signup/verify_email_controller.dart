import 'dart:async';
import 'package:ecommerce_final_year_project/common/widgets/login_signup/success_screen/success_screen.dart';
import 'package:ecommerce_final_year_project/data/repositories/authentication_repository.dart';
import 'package:ecommerce_final_year_project/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    sendEmailVerification();
    startAutoRedirectTimer();
  }

  /// Send Email Verification Link
  Future sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      ELoader.successSnackBar(
        title: 'Email Sent',
        message: 'Please check your inbox and verify your email.',
      );
    } catch (e) {
      ELoader.errorSnackBar(
        title: 'Oh Snap!',
        message: e.toString(),
      );
    }
  }

  /// Timer to automatically redirect after verification
  startAutoRedirectTimer() async {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;

      if (user != null && user.emailVerified) {
        timer.cancel();
        _timer = null;

        // Navigate to SuccessScreen
        Get.offAll(() => SuccessScreen(
              //image: 'assets/images/email_verified.png',
              title: 'Email Verified',
              subtitle: 'Your email has been successfully verified!',
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),
            ));
      }
    });
  }

  /// Manual check (e.g., user clicks "I've verified my email")
  Future<void> checkEmailVerifiedManually() async {
    try {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;

      if (user?.emailVerified ?? false) {
        _timer?.cancel();
        _timer = null;

        Get.off(() => SuccessScreen(
              //image: 'assets/images/email_verified.png',
              title: 'Email Verified',
              subtitle: 'Your email has been successfully verified!',
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),
            ));
      } else {
        ELoader.warningSnackBar(
          title: 'Not Verified',
          message: 'Your email is not verified yet. Please check your inbox.',
        );
      }
    } catch (e) {
      ELoader.errorSnackBar(
        title: 'Error',
        message: e.toString(),
      );
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
