import 'package:ecommerce_final_year_project/data/repositories/authentication_repository.dart';
import 'package:ecommerce_final_year_project/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:ecommerce_final_year_project/utils/helpers/network_manager.dart';
import 'package:ecommerce_final_year_project/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_final_year_project/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  final GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send reset password email
  Future<void> sendPasswordResetEmail() async {
    try {
      // Start Loader
      //EAppScreenLoader.startLoading();

      // Check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        EAppScreenLoader.stopLoading();
        return;
      }

      // Validate Form
      if (!forgetPasswordFormKey.currentState!.validate()) {
        EAppScreenLoader.stopLoading();
        return;
      }

      // Send Email
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // Stop Loader
      EAppScreenLoader.stopLoading();

      // Success Message
      ELoader.successSnackBar(
        title: 'Email Sent',
        message: 'Password reset link has been sent to your email'.tr,
      );

      // Navigate
      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      EAppScreenLoader.stopLoading();
      ELoader.errorSnackBar(
        title: 'Oh Snap',
        message: e.toString(),
      );
    }
  }

  /// Resend reset password email
  Future<void> resendPasswordResetEmail(String email) async {
    try {
      //EAppScreenLoader.startLoading();

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        EAppScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.trim());

      EAppScreenLoader.stopLoading();

      ELoader.successSnackBar(
        title: 'Email Sent',
        message: 'Password reset link resent successfully'.tr,
      );
    } catch (e) {
      EAppScreenLoader.stopLoading();
      ELoader.errorSnackBar(
        title: 'Oh Snap',
        message: e.toString(),
      );
    }
  }

  @override
  void onClose() {
    email.dispose();
    super.onClose();
  }
}
