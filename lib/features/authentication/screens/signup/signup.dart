import 'package:ecommerce_final_year_project/features/authentication/screens/login/widget/login_footer.dart';
import 'package:ecommerce_final_year_project/features/authentication/screens/signup/widget/signupform.dart';
import 'package:ecommerce_final_year_project/features/authentication/screens/signup/widget/termscondition.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/constants/text_sring.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () => Get.back(), icon:  Icon(Iconsax.back_square5),),
        ],
      
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MegamartSize.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                MegamartText.signUpTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: MegamartSize.defaultSpace),

              // Form
              SignupForm(dark: dark),
          

              const SizedBox(height: MegamartSize.spaceBetweenSections),
              
              // Terms & Conditions
              TermsCondition(dark: dark),
              const SizedBox(height: MegamartSize.spaceBetweenSections),
    

              // Footer
              const LoginFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

