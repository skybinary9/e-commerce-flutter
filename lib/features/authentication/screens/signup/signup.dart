import 'package:ecommerce_final_year_project/features/authentication/screens/login/widget/login_footer.dart';
import 'package:ecommerce_final_year_project/features/authentication/screens/signup/widget/signup.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/constants/text_sring.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(),
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

              // Footer
              const LoginFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

