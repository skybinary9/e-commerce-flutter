import 'package:ecommerce_final_year_project/aap.dart';
import 'package:ecommerce_final_year_project/data/repositories/authentication_repository.dart';
import 'package:ecommerce_final_year_project/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();

  // Preserve splash until initialization is fully done
  FlutterNativeSplash.preserve(widgetsBinding: binding);

  // Initialize local storage
  await GetStorage.init();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Inject repositories
  Get.put(AuthenticationRepository());

  // Remove splash AFTER navigation logic
  // screenRedirect() will decide which screen to show


  // Run the app
  runApp(const App());
}
