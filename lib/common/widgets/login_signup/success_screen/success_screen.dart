import 'package:ecommerce_final_year_project/common/styles/megamart_spacing_style.dart';
import 'package:ecommerce_final_year_project/features/authentication/screens/login/login.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/constants/text_sring.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: MegamartPaddingStyle.paddingwithAppbarHeight *2,
          child: Column(
            children: [
              // text tile & subtitle
              Text(
                MegamartText.yourAccountCreatedTitle,
                style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,
              ),
              const SizedBox(height: MegamartSize.spaceBetweenItems),
              Text(
                MegamartText.yourAccountCreatedSubtitle,
                style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: MegamartSize.spaceBetweenItems),



              //button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => LoginScreen()),
                  child: Text(MegamartText.toContinue),
                ),
              ),

            ],),
        
        ),
      ),
    );
  }
}