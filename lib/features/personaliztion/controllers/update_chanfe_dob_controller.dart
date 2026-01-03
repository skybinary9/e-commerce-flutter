import 'package:ecommerce_final_year_project/data/repositories/user_repository.dart';
import 'package:ecommerce_final_year_project/features/personaliztion/controllers/user_controlller.dart';
import 'package:ecommerce_final_year_project/features/personaliztion/screens/profile/pofile_screen.dart';
import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/helpers/network_manager.dart';
import 'package:ecommerce_final_year_project/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_final_year_project/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChangeDobController extends GetxController {
  static ChangeDobController get instance => Get.find();

  final dobController = TextEditingController();

  final userController = UserControlller.instance;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    _initializeDob();
    super.onInit();
  }

  void _initializeDob() {
    if (userController.user.value.dateOfBirth.isNotEmpty) {
      dobController.text = userController.user.value.dateOfBirth;
    }
  }

  /// 📅 Pick Date
  Future<void> pickDate(BuildContext context) async {
    DateTime initialDate = DateTime(2000);
    DateTime firstDate = DateTime(1900);
    DateTime lastDate = DateTime.now();

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (pickedDate != null) {
      dobController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }

  /// 🔄 Update DOB
  Future<void> updateDob() async {
    try {
      if (dobController.text.isEmpty) {
        ELoader.warningSnackBar(
          title: 'Required',
          message: 'Please select your date of birth',
        );
        return;
      }

      EAppScreenLoader.openLoadingDialog(
        'Updating date of birth...',
        MegamartImages.docer,
      );

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        EAppScreenLoader.stopLoading();
        return;
      }

      await userRepository.updateSingleField({
        'dateOfBirth': dobController.text.trim(),
      });

      userController.user.value.dateOfBirth = dobController.text.trim();
      userController.user.refresh();

      EAppScreenLoader.stopLoading();

      ELoader.successSnackBar(
        title: 'Success',
        message: 'Date of birth updated successfully',
      );

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
    dobController.dispose();
    super.onClose();
  }
}
