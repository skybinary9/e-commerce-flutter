import 'package:ecommerce_final_year_project/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_final_year_project/features/personaliztion/controllers/updated_user_name.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeUsernameScreen extends StatelessWidget {
  const ChangeUsernameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateUsernameController());

    return Scaffold(
      appBar: const EAppbar(
        title: Text('Change Username'),
        showbackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(MegamartSize.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Info text
            Text(
              'Choose a unique username. This will be visible on your profile and orders.',
              style: Theme.of(context).textTheme.labelMedium,
            ),

            const SizedBox(height: MegamartSize.spaceBetweenItems),

            /// Form
            Form(
              key: controller.updateUsernameFormKey,
              child: TextFormField(
                controller: controller.username,
                validator: (value) =>
                    MegartValidator.validateEmptyText('Username', value),
                decoration: const InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Iconsax.user_edit),
                ),
              ),
            ),

            const SizedBox(height: MegamartSize.spaceBetweenSections),

            /// Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateUsername(),
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
