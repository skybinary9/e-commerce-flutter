import 'package:ecommerce_final_year_project/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_final_year_project/features/personaliztion/controllers/update_phone_controller.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangePhoneScreen extends StatelessWidget {
  const ChangePhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangePhoneController());

    return Scaffold(
      appBar: const EAppbar(
        title: Text('Change Phone Number'),
        showbackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(MegamartSize.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Info Text
            Text(
              'Update your phone number. This will be used for profile and order notifications.',
              style: Theme.of(context).textTheme.labelMedium,
            ),

            const SizedBox(height: MegamartSize.spaceBetweenItems),

            /// Form
            Form(
              key: controller.changePhoneFormKey,
              child: TextFormField(
                controller: controller.phoneNumber,
                keyboardType: TextInputType.phone,
                validator: (value) =>
                    MegartValidator.validatePhoneNumber(value),
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: Icon(Iconsax.call),
                ),
              ),
            ),

            const SizedBox(height: MegamartSize.spaceBetweenSections),

            /// Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updatePhoneNumber(),
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
