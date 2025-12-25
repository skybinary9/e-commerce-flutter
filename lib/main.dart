import 'package:ecommerce_final_year_project/aap.dart';
import 'package:ecommerce_final_year_project/data/repositories/authentication_repository.dart';
import 'package:ecommerce_final_year_project/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  // Ensure Flutter binding is initialized
  final WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();

  // Initialize local storage
  await GetStorage.init();

  // Preserve splash screen
  FlutterNativeSplash.preserve(widgetsBinding: binding);

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Inject AuthenticationRepository using GetX
  Get.put(AuthenticationRepository());

  // Remove splash screen after initialization
  FlutterNativeSplash.remove();

  // Run the App
  runApp(const App());
}
