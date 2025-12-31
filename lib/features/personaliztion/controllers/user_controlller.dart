import 'package:ecommerce_final_year_project/data/repositories/authentication_repository.dart';
import 'package:ecommerce_final_year_project/data/repositories/user_repository.dart';
import 'package:ecommerce_final_year_project/features/authentication/models/user_model.dart';
import 'package:ecommerce_final_year_project/features/authentication/screens/login/login.dart';
import 'package:ecommerce_final_year_project/features/authentication/screens/login/widget/login_form.dart';
import 'package:ecommerce_final_year_project/features/personaliztion/screens/profile/widget/re_authnication.dart';
import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/helpers/network_manager.dart';
import 'package:ecommerce_final_year_project/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_final_year_project/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserControlller extends GetxController {
  static UserControlller get instance => Get.find();

  final profileLoading = false.obs;
  final Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Fetch user details
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final fetchedUser = await userRepository.fetchUserDetails();
      user(fetchedUser);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Save user record
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential == null) return;

      final nameParts =
          UserModel.nameParts(userCredential.user?.displayName ?? '');
      final username =
          UserModel.generateUsername(userCredential.user?.displayName ?? '');

      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: nameParts[0],
        lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
        email: userCredential.user?.email ?? '',
        username: username,
        phoneNumber: userCredential.user?.phoneNumber ?? '',
        profilePicture: userCredential.user?.photoURL ?? '',
      );

      await userRepository.saveUserRecord(newUser);
    } catch (e) {
      ELoader.warningSnackBar(
        title: 'Warning',
        message: 'Something went wrong while saving profile data.',
      );
    }
  }

  /// Delete account confirmation popup
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(MegamartSize.sm),
      title: "Delete Account",
      middleText:
          'Are you sure you want to delete your account? This action cannot be undone.',
      confirm: ElevatedButton(
        onPressed: deleteUserAccount,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: MegamartSize.lg),
          child: Text("Delete"),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Get.back(),
        child: const Text("Cancel"),
      ),
    );
  }

  /// Delete user account (Google / Email)
  Future<void> deleteUserAccount() async {
    try {
      EAppScreenLoader.openLoadingDialog(
        'Processing',
        MegamartImages.docer,
      );

      final auth = AuthenticationRepository.instance;
      final providers =
          auth.authUser?.providerData.map((e) => e.providerId).toList() ?? [];

      if (providers.contains('google.com')) {
        await auth.signInWithGoogle();
        await auth.deleteAccount();
        EAppScreenLoader.stopLoading();
        Get.offAll(() => const LoginForm());
        return;
      }

      /// Email/password users → go to re-auth screen
      EAppScreenLoader.stopLoading();
      Get.to(() => const ReAuthnication());
    } catch (e) {
      EAppScreenLoader.stopLoading();
      ELoader.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// Re-authentication for Email/Password users
  Future<void> reAuthicationEamilAndPasswordUser() async {
    try {
      EAppScreenLoader.openLoadingDialog(
        "Processing",
        MegamartImages.docer,
      );

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        EAppScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        EAppScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
    .reAuthicationWithEamilAndPassword(
      verifyEmail.text.trim(),
      verifyPassword.text.trim(),
    );
    await AuthenticationRepository.instance.deleteAccount();

      EAppScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      EAppScreenLoader.stopLoading();
      ELoader.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
