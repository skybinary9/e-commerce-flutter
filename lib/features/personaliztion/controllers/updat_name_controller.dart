import 'package:ecommerce_final_year_project/data/repositories/user_repository.dart';
import 'package:ecommerce_final_year_project/features/personaliztion/controllers/user_controlller.dart';
import 'package:ecommerce_final_year_project/features/personaliztion/screens/profile/pofile_screen.dart';
import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/helpers/network_manager.dart';
import 'package:ecommerce_final_year_project/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_final_year_project/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdatNameController extends GetxController {
  static UpdatNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();

  final userController = UserControlller.instance;
  final userRepository = Get.put(UserRepository());

  final GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  Key? get reAuthFormKey => null;

  @override
  void onInit() {
    _initializeName();
    super.onInit();
  }

  /// Load existing user name
  void _initializeName() {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  /// Update name
  Future<void> updateUserName() async {
    try {
      /// Loader start
      EAppScreenLoader.openLoadingDialog(
        "We are updating your information......",
        MegamartImages.docer,
      );

      /// Internet check
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        EAppScreenLoader.stopLoading();
        return;
      }

      /// Form validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        EAppScreenLoader.stopLoading();
        return;
      }

      /// Firestore update (✔ correct keys)
      final Map<String, dynamic> nameData = {
        'firstName': firstName.text.trim(),
        'lastName': lastName.text.trim(),
      };

      await userRepository.updateSingleField(nameData);

      /// Update local Rx user
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();
      userController.user.refresh();

      /// Loader stop
      EAppScreenLoader.stopLoading();

      /// Success message
      ELoader.successSnackBar(
        title: 'Congratulations',
        message: 'Your name has been updated',
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
    firstName.dispose();
    lastName.dispose();
    super.onClose();
  }
}
