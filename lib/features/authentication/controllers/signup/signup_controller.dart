import 'package:ecommerce_final_year_project/data/repositories/authentication_repository.dart';
import 'package:ecommerce_final_year_project/data/repositories/user_repository.dart';
import 'package:ecommerce_final_year_project/features/authentication/models/user_model.dart';
import 'package:ecommerce_final_year_project/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/helpers/network_manager.dart';
import 'package:ecommerce_final_year_project/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_final_year_project/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // Controllers
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final username = TextEditingController();
  final phonenumber = TextEditingController();

  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// Signup Method
  void signup() async {
    try {
      /// Start loader
      EAppScreenLoader.openLoadingDialog(
        'We are processing your information...', MegamartImages.lottieAnamtion,
        
      );

      /// Check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;
      
      /// Form validation
      if (!signupFormKey.currentState!.validate()) return;
      

      /// Privacy policy acceptance
      if (!privacyPolicy.value){
        ELoader.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: "In order to create account, you must have to read  and accept the Privacy Policy & Terms Of Use" );
          return;
      }

      /// Firebase Authentication
      final userCredential = await AuthenticationRepository.instance.createWithEmailPassword(email.text.trim(), password.text.trim());


      /// Save user data in Firestore
      /// Save user data in Firestore
    final newUser = UserModel(
      id: userCredential.user!.uid, // ✅ Correct way
      firstName: firstName.text.trim(),
      lastName: lastName.text.trim(),
      email: email.text.trim(),
      phoneNumber: phonenumber.text.trim(),
      profilePicture: '',
      username: username.text.trim(),
);

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      /// Success message
      ELoader.successSnackBar(
        title: 'Account Created',
        message: 'Your account has been created successfully.',
      );

      /// Navigate to verification screen
      Get.to(() => const VerifyEmailScreen());


    } catch (e) {
      ELoader.errorSnackBar(
        title: 'Oh Snap!',
        message: e.toString(),
      );
    }
     finally {
      /// Stop loader safely
      EAppScreenLoader.stopLoading();
    }
  }

}
