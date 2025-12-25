import 'package:ecommerce_final_year_project/features/authentication/controllers/signup/signup_controller.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/constants/text_sring.dart';
import 'package:ecommerce_final_year_project/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;

    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [

          // First & Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      MegartValidator.validateEmptyText(
                          MegamartText.firstName, value),
                  decoration: const InputDecoration(
                    labelText: MegamartText.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: MegamartSize.spaceBetweenInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      MegartValidator.validateEmptyText(
                          MegamartText.lastName, value),
                  decoration: const InputDecoration(
                    labelText: MegamartText.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: MegamartSize.spaceBetweenInputFields),

          // Username
          TextFormField(
            controller: controller.username,
            validator: (value) =>
                MegartValidator.validateEmptyText(
                    MegamartText.username, value),
            decoration: const InputDecoration(
              labelText: MegamartText.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),

          const SizedBox(height: MegamartSize.spaceBetweenInputFields),

          // Email
          TextFormField(
            controller: controller.email,
            validator: (value) => MegartValidator.validateEmail(value),
            decoration: const InputDecoration(
              labelText: MegamartText.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),

          const SizedBox(height: MegamartSize.spaceBetweenInputFields),

          // Phone
          TextFormField(
            controller: controller.phonenumber,
            validator: (value) =>
                MegartValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(
              labelText: MegamartText.phoneNumber,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),

          const SizedBox(height: MegamartSize.spaceBetweenInputFields),

          // Password + Confirm Password
          Row(
            children: [
              Expanded(
                child: Obx(() => TextFormField(
                      controller: controller.password,
                      validator: (value) =>
                          MegartValidator.validatePassword(value),
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
              ),
              const SizedBox(width: MegamartSize.spaceBetweenInputFields),
              Expanded(
                child: Obx(() => TextFormField(
                      controller: controller.confirmPassword,
                      validator: (value) =>
                          MegartValidator.validateConfirmPassword(
                              value, controller.password.text),
                      obscureText: controller.hidePassword.value,
                      decoration: InputDecoration(
                        labelText:
                            MegamartText.confirmPassword,
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
              ),
            ],
          ),

          const SizedBox(height: MegamartSize.spaceBetweenInputFields),

          // Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: controller.signup,
              child: const Text('Sign Up'),
            ),
          ),
        ],
      ),
    );
  }
}
