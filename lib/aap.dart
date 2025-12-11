import 'package:ecommerce_final_year_project/data/repositories/authentication_repository.dart';
import 'package:ecommerce_final_year_project/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MegamartTheme.lighTheme,
      darkTheme: MegamartTheme.darkTheme,
      home: const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(AuthenticationRepository());
      }),
      );
    
  }
}