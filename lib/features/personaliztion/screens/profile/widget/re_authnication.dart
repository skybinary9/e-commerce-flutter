import 'package:ecommerce_final_year_project/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_final_year_project/features/personaliztion/controllers/user_controlller.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/constants/text_sring.dart';
import 'package:ecommerce_final_year_project/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthnication extends StatelessWidget {
  const ReAuthnication({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserControlller());
    return Scaffold(
      appBar: EAppbar(title: Text('Re-Authication'), showbackArrow: true,),
      body: Material(
  child: Padding(
    padding: const EdgeInsets.all(MegamartSize.defaultSpace),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Use real name for easy verification. This name will appear on server page",
            style: Theme.of(context).textTheme.labelMedium,
          ),

          const SizedBox(height: MegamartSize.spaceBetweenItems),

          Form(
            key: controller.reAuthFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: (value) =>
                      MegartValidator.validateEmail(value),
                  decoration: const InputDecoration(
                    labelText: 'Your Email',
                    prefixIcon: Icon(Iconsax.direct_right),
                  ),
                ),

                const SizedBox(height: MegamartSize.spaceBetweenItems),

                Obx(
                  () => TextFormField(
                    controller: controller.verifyPassword,
                    validator: (value) =>
                        MegartValidator.validateEmptyText(
                            'Password', value),
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
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: MegamartSize.spaceBetweenItems),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () =>
                  controller.reAuthicationEamilAndPasswordUser(),
              child: const Text("Verify"),
            ),
          ),
        ],
      ),
    ),
  ),
),

    );
  }
}