import 'package:ecommerce_final_year_project/data/repositories/user_repository.dart';
import 'package:ecommerce_final_year_project/features/personaliztion/controllers/user_controlller.dart';
import 'package:ecommerce_final_year_project/features/personaliztion/screens/profile/pofile_screen.dart';
import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/helpers/network_manager.dart';
import 'package:ecommerce_final_year_project/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_final_year_project/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeGenderController extends GetxController {
  static ChangeGenderController get instance => Get.find();

  /// Selected gender
  final RxString selectedGender = ''.obs;

  /// Dependencies
  final userController = UserControlller.instance;
  final userRepository = Get.put(UserRepository());

  /// Form key
  final GlobalKey<FormState> changeGenderFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    _initializeGender();
    super.onInit();
  }

  /// Load existing gender
  void _initializeGender() {
    selectedGender.value = userController.user.value.gender;
  }

  /// Update gender
  Future<void> updateGender() async {
    try {
      /// Loader start
      EAppScreenLoader.openLoadingDialog(
        "Updating your gender...",
        MegamartImages.docer,
      );

      /// Internet check
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        EAppScreenLoader.stopLoading();
        return;
      }

      /// Validation
      if (selectedGender.value.isEmpty) {
        EAppScreenLoader.stopLoading();
        ELoader.warningSnackBar(
          title: 'Required',
          message: 'Please select your gender',
        );
        return;
      }

      /// Firestore update
      await userRepository.updateSingleField({
        'gender': selectedGender.value,
      });

      /// Update local Rx user
      userController.user.value.gender = selectedGender.value;
      userController.user.refresh();

      /// Loader stop
      EAppScreenLoader.stopLoading();

      /// Success message
      ELoader.successSnackBar(
        title: 'Success',
        message: 'Gender updated successfully',
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
}
