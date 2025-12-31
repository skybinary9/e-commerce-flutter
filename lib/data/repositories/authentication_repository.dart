import 'package:ecommerce_final_year_project/data/repositories/user_repository.dart';
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
//import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ///Veriables
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final deviceStorage = GetStorage();

  ///Get the authication user data
  User? get authUser => _auth.currentUser;
  /// Collected from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
    
  }

  /// Redirect user based on auth & verification state
  Future<void> screenRedirect() async {
  final user = _auth.currentUser;

  if (user != null) {
    final providerIds = user.providerData.map((e) => e.providerId);

    // ✅ Google or Facebook login
    if (providerIds.contains('google.com') ||
        providerIds.contains('facebook.com')) {
      Get.offAll(() => const NavigationMenu());
      return;
    }

    // ✅ Email & Password login
    if (user.emailVerified) {
      Get.offAll(() => const NavigationMenu());
    } else {
      Get.offAll(() => VerifyEmailScreen(email: user.email));
    }
  } else {
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

  //--------------------- forget password -------------------//
  
  Future<void> sendPasswordResetEmail(
      String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
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

/*
  //--------------------- facebook Authentication -------------------//

  Future<UserCredential?> signInWithFacebook() async {
  try {
    // 1️⃣ Facebook Login
    final LoginResult result = await FacebookAuth.instance.login(
      permissions: ['email', 'public_profile'],
    );

    if (result.status != LoginStatus.success) {
      return null; // user cancelled
    }

    // 2️⃣ Create Firebase Credential
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(
      result.accessToken!.token,
    );

    // 3️⃣ Firebase Sign-In
    return await _auth.signInWithCredential(facebookAuthCredential);

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
*/

//--------------------- Google Authentication -------------------//

Future<UserCredential?> signInWithGoogle() async {
  try {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? userAccount =
        await googleSignIn.signIn();

    if (userAccount == null) return null;

    final GoogleSignInAuthentication googleAuth =
        await userAccount.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await _auth.signInWithCredential(credential);
  } catch (e) {
    throw 'Google sign-in failed: $e';
  }
}

  /*------------------EmaVerification ------------------*/
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

  /*------------------ Delete User Account ------------------*/
Future<void> deleteAccount() async {
  try {
    final user = _auth.currentUser;
    if (user == null) throw 'No logged-in user found';

    await UserRepository.instance.removeUserRecode(_auth.currentUser!.uid);
    await _auth.currentUser?.delete();
  } on FirebaseAuthException catch (e) {
    throw FirebaseAuthExceptionHandler(e.code).message;
  } catch (_) {
    throw 'Account deletion failed. Please re-authenticate.';
  }
}
/*------------------ Re-Authenticate Email & Password ------------------*/
Future<void> reAuthicationWithEamilAndPassword(
  String email,
  String password,
) async {
  try {
    final user = _auth.currentUser;
    if (user == null) throw 'No logged-in user found';

    final credential = EmailAuthProvider.credential(
      email: email,
      password: password,
    );

    await user.reauthenticateWithCredential(credential);
  } on FirebaseAuthException catch (e) {
    throw FirebaseAuthExceptionHandler(e.code).message;
  } catch (_) {
    throw 'Re-authentication failed';
  }
}


}
