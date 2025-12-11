import 'package:ecommerce_final_year_project/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/constants/text_sring.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
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
            TextField(
              decoration: InputDecoration(
                labelText: MegamartText.email,
                prefixIcon: const Icon(Iconsax.direct_right),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(MegamartSize.inputFieldRadius),
                ),
              ),
            ),
            const SizedBox(height: MegamartSize.defaultSpace),


            //submit button
            SizedBox(
              width: double.infinity,
            child: ElevatedButton(onPressed: ()=>Get.off(ResetPassword()), child: Text(MegamartText.submit)))
              
            

          ],
          

        ),
        ),
    );
  }
}