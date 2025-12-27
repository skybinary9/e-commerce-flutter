import 'package:ecommerce_final_year_project/features/authentication/screens/login/login.dart';
import 'package:ecommerce_final_year_project/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ecommerce_final_year_project/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce_final_year_project/navigationbottom.dart';
import 'package:ecommerce_final_year_project/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:ecommerce_final_year_project/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce_final_year_project/utils/exceptions/format_exceptions.dart';
import 'package:ecommerce_final_year_project/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final deviceStorage = GetStorage();

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
    
  }

  /// Redirect user based on auth & verification state
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());  // home
        } else {
          Get.offAll(() => VerifyEmailScreen(
            email: user.email,
            ));
  }
  } 
else {
      // First-time check
      deviceStorage.writeIfNull('IsFirstTime', true);
      final isFirstTime = deviceStorage.read('IsFirstTime') as bool;

      if (isFirstTime) {
        Get.offAll(() => const Onboarding());
      } else {
        Get.offAll(() => const LoginScreen());
      }
    }
  }

  /*------------------ Email & Password Register ------------------*/

  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try{
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler(e.code).message;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } on PlatformException catch (e) {
      throw PlatformExceptionHandler(e.code).message;
    } on FormatException {
      throw FormatExceptionHandler.message();
    } catch (_) {
      throw 'Something went wrong. Please try again.';
    } 
  }

  Future<UserCredential> createWithEmailPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler(e.code).message;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } on PlatformException catch (e) {
      throw PlatformExceptionHandler(e.code).message;
    } on FormatException {
      throw FormatExceptionHandler.message();
    } catch (_) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /*------------------ Email Verification ------------------*/
  Future<void> sendEmailVerification() async {
    try {
      final user = _auth.currentUser;
      if (user == null) throw 'No logged-in user found.';

      await user.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler(e.code).message;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } on PlatformException catch (e) {
      throw PlatformExceptionHandler(e.code).message;
    } on FormatException {
      throw FormatExceptionHandler.message();
    } catch (_) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /*------------------ Logout ------------------*/
  Future<void> logout() async {
    try {
      await _auth.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler(e.code).message;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } on PlatformException catch (e) {
      throw PlatformExceptionHandler(e.code).message;
    } on FormatException {
      throw FormatExceptionHandler.message();
    } catch (_) {
      throw 'Something went wrong. Please try again.';
    }
  }
}
