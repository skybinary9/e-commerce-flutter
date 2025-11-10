import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/constants/text_sring.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


/// ---------------------------------------------------------------------------
/// 🟢 LOGIN FORM WIDGET
/// ---------------------------------------------------------------------------
class LoginForm extends StatelessWidget {
  const LoginForm();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: MegamartSize.spaceBtwSection),
        child: Column(
          children: [
            // Email Field
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.direct_right),
                labelText: MegamartText.email,
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(MegamartSize.inputfieldradius),
                ),
              ),
            ),
            const SizedBox(height: MegamartSize.spaceBtwInputFields),

            // Password Field
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                suffixIcon: const Icon(Iconsax.eye_slash),
                prefix: const Icon(Iconsax.password_check),
                labelText: MegamartText.password,
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(MegamartSize.inputfieldradius),
                ),
              ),
            ),
            const SizedBox(height: MegamartSize.spaceBtwInputFields / 2),

            // Remember Me + Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    Text(MegamartText.rememberMe),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(MegamartText.forgotPassword),
                ),
              ],
            ),

            const SizedBox(height: MegamartSize.spaceBtwSection),

            // Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(MegamartSize.buttonradius),
                  ),
                ),
                child: const Text(
                  MegamartText.signIn,
                  style: TextStyle(
                    fontSize: MegamartSize.fontsizelg,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: MegamartSize.spaceBtwSection),

            // Sign Up Text
            TextButton(
              onPressed: () {},
              child: RichText(
                text: TextSpan(
                  text: MegamartText.noAccount,
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: MegamartText.signUp,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
