import 'package:ecommerce_final_year_project/data/repositories/user_repository.dart';
import 'package:ecommerce_final_year_project/features/personaliztion/controllers/user_controlller.dart';
import 'package:ecommerce_final_year_project/features/personaliztion/screens/profile/pofile_screen.dart';
import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/helpers/network_manager.dart';
import 'package:ecommerce_final_year_project/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_final_year_project/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePhoneController extends GetxController {
  static ChangePhoneController get instance => Get.find();

  /// Controller
  final phoneNumber = TextEditingController();

  /// Dependencies
  final userController = UserControlller.instance;
  final userRepository = Get.put(UserRepository());

  /// Form key
  final GlobalKey<FormState> changePhoneFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    _initializePhone();
    super.onInit();
  }

  /// Load existing phone number
  void _initializePhone() {
    phoneNumber.text = userController.user.value.phoneNumber;
  }

  /// Update phone number (Firestore)
  Future<void> updatePhoneNumber() async {
    try {
      /// Loader start
      EAppScreenLoader.openLoadingDialog(
        "Updating phone number...",
        MegamartImages.docer,
      );

      /// Internet check
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        EAppScreenLoader.stopLoading();
        return;
      }

      /// Validation
      if (!changePhoneFormKey.currentState!.validate()) {
        EAppScreenLoader.stopLoading();
        return;
      }

      /// Firestore update
      await userRepository.updateSingleField({
        'phoneNumber': phoneNumber.text.trim(),
      });

      /// Update local Rx user
      userController.user.value.phoneNumber = phoneNumber.text.trim();
      userController.user.refresh();

      /// Loader stop
      EAppScreenLoader.stopLoading();

      /// Success message
      ELoader.successSnackBar(
        title: 'Success',
        message: 'Phone number updated successfully',
      );

      /// Navigate back
      Get.off(() => const PofileScreen());
    } catch (e) {
      EAppScreenLoader.stopLoading();
      ELoader.errorSnackBar(
        title: 'Oh Snap!',
        message: e.toString(),
      );
    }
  }

  @override
  void onClose() {
    phoneNumber.dispose();
    super.onClose();
  }
}
