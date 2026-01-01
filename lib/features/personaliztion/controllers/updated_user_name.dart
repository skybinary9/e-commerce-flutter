import 'package:ecommerce_final_year_project/data/repositories/user_repository.dart';
import 'package:ecommerce_final_year_project/features/personaliztion/controllers/user_controlller.dart';
import 'package:ecommerce_final_year_project/features/personaliztion/screens/profile/pofile_screen.dart';
import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/helpers/network_manager.dart';
import 'package:ecommerce_final_year_project/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_final_year_project/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateUsernameController extends GetxController {
  static UpdateUsernameController get instance => Get.find();

  /// Controllers
  final username = TextEditingController();

  /// Dependencies
  final userController = UserControlller.instance;
  final userRepository = Get.put(UserRepository());

  /// Form key
  final GlobalKey<FormState> updateUsernameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    _initializeUsername();
    super.onInit();
  }

  /// Load existing username
  void _initializeUsername() {
    username.text = userController.user.value.username;
  }

  /// 🔄 Update Username (NO verification required)
  Future<void> updateUsername() async {
    try {
      /// Loader start
      EAppScreenLoader.openLoadingDialog(
        'Updating your username...',
        MegamartImages.docer,
      );

      /// Internet check
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        EAppScreenLoader.stopLoading();
        return;
      }

      /// Form validation
      if (!updateUsernameFormKey.currentState!.validate()) {
        EAppScreenLoader.stopLoading();
        return;
      }

      /// Firestore update
      final Map<String, dynamic> usernameData = {
        'username': username.text.trim(),
      };

      await userRepository.updateSingleField(usernameData);

      /// Update local Rx user
      userController.user.value.username = username.text.trim();
      userController.user.refresh();

      /// Loader stop
      EAppScreenLoader.stopLoading();

      /// Success message
      ELoader.successSnackBar(
        title: 'Success',
        message: 'Username updated successfully',
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
    username.dispose();
    super.onClose();
  }
}
