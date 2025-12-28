import 'package:ecommerce_final_year_project/features/authentication/controllers/forgetpassword/forgetpassword_controller.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/constants/text_sring.dart';
import 'package:ecommerce_final_year_project/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ForgetPasswordController.instance;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(MegamartSize.defaultSpace), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Heading 
            Text(MegamartText.headingChangePasswordTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
            const SizedBox(height: MegamartSize.spaceBetweenItems),
            //Subheading
            Text(MegamartText.subheadingForgetPassword, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
            const SizedBox(height: MegamartSize.defaultSpace),

            //text field
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: MegartValidator.validateEmail,
                decoration: InputDecoration(
                  labelText: MegamartText.email,
                  prefixIcon: const Icon(Iconsax.direct_right),
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(MegamartSize.inputFieldRadius),
                  ),
                ),
              ),
            ),
            const SizedBox(height: MegamartSize.defaultSpace),


            //submit button
            SizedBox(
              width: double.infinity,
            child: ElevatedButton(onPressed: ()=>controller.sendPasswordResetEmail(), child: Text(MegamartText.submit)))
          ],

        ),
        ),
    );
  }
}