import 'package:ecommerce_final_year_project/data/repositories/authentication_repository.dart';
import 'package:ecommerce_final_year_project/data/repositories/user_repository.dart';
import 'package:ecommerce_final_year_project/features/personaliztion/controllers/user_controlller.dart';
import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/helpers/network_manager.dart';
import 'package:ecommerce_final_year_project/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_final_year_project/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateEmailController extends GetxController {
  static UpdateEmailController get instance => Get.find();

  /// Controllers
  final email = TextEditingController();
  final password = TextEditingController();

  /// Form key
  final GlobalKey<FormState> updateEmailFormKey = GlobalKey<FormState>();

  /// Dependencies
  final userController = UserControlller.instance;
  final userRepository = UserRepository.instance;
  final authRepository = AuthenticationRepository.instance;

  @override
  void onInit() {
    super.onInit();
    email.text = userController.user.value.email;
  }

  /// ✅ Update Email (WORKING)
  Future<void> updateUserEmail() async {
    try {
      EAppScreenLoader.openLoadingDialog(
        'Updating your email...',
        MegamartImages.docer,
      );

      /// 🌐 Internet check
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        EAppScreenLoader.stopLoading();
        ELoader.errorSnackBar(
          title: 'No Internet',
          message: 'Please check your connection',
        );
        return;
      }

      /// 🧾 Form validation
      if (!updateEmailFormKey.currentState!.validate()) {
        EAppScreenLoader.stopLoading();
        return;
      }

      /// 🔐 Re-authentication
      await authRepository.reAuthicationWithEamilAndPassword(
        userController.user.value.email,
        password.text.trim(),
      );

      /// 📧 Send verification & update auth email
      await authRepository.authUser!
          .verifyBeforeUpdateEmail(email.text.trim());

      /// 🔥 Update Firestore email
      await userRepository.updateSingleField({
        'email': email.text.trim(),
      });

      EAppScreenLoader.stopLoading();

      /// ✅ Success
      ELoader.successSnackBar(
        title: 'Verify Email',
        message:
            'Verification link sent to new email. Please verify and login again.',
      );

      /// 🔐 Logout
      await authRepository.logout();

    } catch (e) {
      EAppScreenLoader.stopLoading();
      ELoader.errorSnackBar(
        title: 'Oh Snap!',
        message: e.toString(),
      );
    }
  }
}
