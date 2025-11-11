import 'package:ecommerce_final_year_project/features/authentication/screens/signup/widget/termscondition.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/constants/text_sring.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // First & Last Name Row
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: MegamartText.firstName,
                    prefixIcon: const Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: MegamartSize.spaceBetweenInputFields),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: MegamartText.lastName,
                    prefixIcon: const Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
    
          const SizedBox(height: MegamartSize.spaceBetweenInputFields),
    
          // Username
          TextFormField(
            decoration: InputDecoration(
              labelText: MegamartText.username,
              prefixIcon: const Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(height: MegamartSize.spaceBetweenInputFields),
    
          // Email
          TextFormField(
            decoration: InputDecoration(
              labelText: MegamartText.email,
              prefixIcon: const Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: MegamartSize.spaceBetweenInputFields),
    
          // Phone Number
          TextFormField(
            decoration: InputDecoration(
              labelText: MegamartText.phoneNumber,
              prefixIcon: const Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: MegamartSize.spaceBetweenInputFields),
    
          // Password
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: MegamartText.password,
              prefixIcon: const Icon(Iconsax.password_check),
              suffixIcon: const Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(height: MegamartSize.spaceBetweenInputFields),
    
          // Terms & Conditions
          TermsCondition(dark: dark),
          const SizedBox(height: MegamartSize.spaceBetweenSections),
    
          // Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Sign Up'),
            ),
          ),
        ],
      ),
    );
  }
}

