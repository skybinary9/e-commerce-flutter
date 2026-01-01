import 'package:ecommerce_final_year_project/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_final_year_project/features/personaliztion/controllers/updat_email_controller.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/constants/text_sring.dart';
import 'package:ecommerce_final_year_project/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
class UpdateEmailScreen extends StatelessWidget {
  const UpdateEmailScreen({super.key});

  /// ✅ Controller injection (CORRECT PLACE)g

  @override
  Widget build(BuildContext context) {
    final UpdateEmailController controller =
      Get.put(UpdateEmailController());
    return Scaffold(
      appBar: const EAppbar(
        title: Text('Update Email'),
        showbackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(MegamartSize.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Info Text
            Text(
              'Enter your new email address and confirm your password for security verification.',
              style: Theme.of(context).textTheme.labelMedium,
            ),

            const SizedBox(height: MegamartSize.spaceBetweenItems),

            /// Form
            Form(
              key: controller.updateEmailFormKey,
              child: Column(
                children: [
                  /// Email Field
                  TextFormField(
                    controller: controller.email,
                    validator: (value) =>
                        MegartValidator.validateEmail(value),
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'New Email',
                      prefixIcon: Icon(Iconsax.sms),
                    ),
                  ),

                  const SizedBox(height: MegamartSize.spaceBetweenItems),

                  /// Password Field
                  TextFormField(
                    controller: controller.password,
                    validator: (value) =>
                        MegartValidator.validateEmptyText(
                            'Password', value),
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Current Password',
                      prefixIcon: Icon(Iconsax.lock),
                    ),
                  ),
                  const SizedBox(height: MegamartSize.spaceBetweenItems),
                  Align(alignment: AlignmentGeometry.topLeft, child: Text(MegamartText.changeEmail, style: Theme.of(context).textTheme.labelLarge,))
                ],
              ),
            ),

            const SizedBox(height: MegamartSize.spaceBetweenSections),

            /// Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.updateUserEmail,
                child: const Text('Update Email'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
