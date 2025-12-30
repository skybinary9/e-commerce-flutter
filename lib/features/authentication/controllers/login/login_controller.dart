import 'package:ecommerce_final_year_project/data/repositories/authentication_repository.dart';
import 'package:ecommerce_final_year_project/features/personaliztion/controllers/user_controlller.dart';
import 'package:ecommerce_final_year_project/utils/helpers/network_manager.dart';
import 'package:ecommerce_final_year_project/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_final_year_project/utils/popups/loaders.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // Explicit type, avoid naming conflict
  final UserControlller userController = Get.put(UserControlller());

  /// Email & Password Sign In
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        EAppScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!loginFormKey.currentState!.validate()) {
        EAppScreenLoader.stopLoading();
        return;
      }

      // Save credentials if "Remember Me"
      if (rememberMe.value) {
        localStorage.write('Remember_Me_Email', email.text.trim());
        localStorage.write('Remember_Me_Password', password.text.trim());
      }

      // Sign in
      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove loader
      EAppScreenLoader.stopLoading();

      // Redirect
      await AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      EAppScreenLoader.stopLoading();
      ELoader.errorSnackBar(title: 'On Snap', message: e.toString());
    }
  }
/*
  /// Facebook Sign-In Authentication
Future<void> facebookSignIn() async {
  try {
    // Check internet connection
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) return;

    // Optional Loader
    // EAppScreenLoader.openLoadingDialog();

    // Facebook Authentication
    final userCredential =
        await AuthenticationRepository.instance.signInWithFacebook();

    if (userCredential != null) {
      // Save user record in Firestore
      await userController.saveUserRecord(userCredential);
    }

    // Stop loader
    EAppScreenLoader.stopLoading();

    // Redirect user
    await AuthenticationRepository.instance.screenRedirect();
  } catch (e) {
    EAppScreenLoader.stopLoading();
    ELoader.errorSnackBar(
      title: 'Facebook Sign-In',
      message: e.toString(),
    );
  }
}*/


  /// Google Sign-In Authentication
  Future<void> googleSignIn() async {
  try {
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) return;

    //EAppScreenLoader.openLoadingDialog();

    final userCredential =
        await AuthenticationRepository.instance.signInWithGoogle();

    if (userCredential != null) {
      await userController.saveUserRecord(userCredential);
    }

    EAppScreenLoader.stopLoading();
    await AuthenticationRepository.instance.screenRedirect();
  } catch (e) {
    EAppScreenLoader.stopLoading();
    ELoader.errorSnackBar(title: 'Google Sign-In', message: e.toString());
  }
}
}
