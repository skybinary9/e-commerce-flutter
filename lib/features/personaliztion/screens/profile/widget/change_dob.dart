import 'package:ecommerce_final_year_project/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_final_year_project/features/personaliztion/controllers/update_chanfe_dob_controller.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeDobScreen extends StatelessWidget {
  const ChangeDobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangeDobController());

    return Scaffold(
      appBar: const EAppbar(
        title: Text('Change Date of Birth'),
        showbackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(MegamartSize.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 🔹 Info
            Text(
              "Select your correct date of birth. This information helps in verification.",
              style: Theme.of(context).textTheme.labelMedium,
            ),

            const SizedBox(height: MegamartSize.spaceBetweenItems),

            /// 🔹 DOB Field
            TextFormField(
              readOnly: true,
              controller: controller.dobController,
              onTap: () => controller.pickDate(context),
              decoration: const InputDecoration(
                labelText: 'Date of Birth',
                prefixIcon: Icon(Iconsax.calendar),
              ),
            ),

            const SizedBox(height: MegamartSize.spaceBetweenItems),

            /// 🔹 Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.updateDob,
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
