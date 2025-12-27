import 'package:ecommerce_final_year_project/features/authentication/controllers/login/login_controller.dart';
import 'package:ecommerce_final_year_project/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:ecommerce_final_year_project/features/authentication/screens/signup/signup.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/constants/text_sring.dart';
import 'package:ecommerce_final_year_project/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

/// ---------------------------------------------------------------------------
///  LOGIN FORM WIDGET
/// ---------------------------------------------------------------------------
class LoginForm extends StatelessWidget {
  const LoginForm({super.key});
  

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginformkey,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: MegamartSize.spaceBetweenSections),
        child: Column(
          children: [
            // Email Field
            TextFormField(
              controller: controller.email,
              validator: (value)=> MegartValidator.validateEmail(value),
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.direct_right),
                labelText: MegamartText.email,
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(MegamartSize.inputFieldRadius),
                ),
              ),
            ),
            const SizedBox(height: MegamartSize.spaceBetweenInputFields),

            // Password Field
            Obx(() => TextFormField(
                      controller: controller.password,
                      validator: (value) =>
                          MegartValidator.validateEmptyText('Password', value),
                      obscureText: controller.hidePassword.value,
                      decoration: InputDecoration(
                        labelText: MegamartText.password,
                        prefixIcon:
                            const Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                          onPressed: () =>
                              controller.hidePassword.toggle(),
                          icon: Icon(
                            controller.hidePassword.value
                                ? Iconsax.eye_slash
                                : Iconsax.eye,
                          ),
                        ),
                      ),
                    )),
            const SizedBox(height: MegamartSize.spaceBetweenInputFields / 2),

            // Remember Me + Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(()=> Checkbox(value: controller.rememberMe.value, 
                    onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value)),
                    Text(MegamartText.rememberMe),
                  ],
                ),
                TextButton(
                  onPressed: ()=>Get.to(()=> const ForgetPassword()),
                  child: const Text(MegamartText.forgotPassword),
                ),
              ],
            ),

            const SizedBox(height: MegamartSize.spaceBetweenSections),

            // Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignIn(),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(MegamartSize.buttonRadius),
                  ),
                ),
                child: const Text(
                  MegamartText.signIn,
                  style: TextStyle(
                    fontSize: MegamartSize.fontLg,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: MegamartSize.spaceBetweenSections),

            // Sign Up Text
            TextButton(
              
              onPressed: () => Get.to(()=> SignupScreen()),
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
