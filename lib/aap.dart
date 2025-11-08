import 'package:ecommerce_final_year_project/splash.dart';
import 'package:ecommerce_final_year_project/utils/theme/theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MegamartTheme.lighTheme,
      darkTheme: MegamartTheme.darkTheme,
      home: const SplashScreen(), // <-- SplashScreen as initial screen
      );
    
  }
}