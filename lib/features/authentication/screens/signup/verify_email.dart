import 'package:ecommerce_final_year_project/data/repositories/authentication_repository.dart';
import 'package:ecommerce_final_year_project/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/constants/text_sring.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.emial, String? email

  });
  final String ? emial;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put( VerifyEmailController());

    return Scaffold(      
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () =>AuthenticationRepository.instance.logout(), 
          icon: const Icon(CupertinoIcons.clear),), 
        ],
      ),
      body: SingleChildScrollView(
        child : Padding(
          padding: EdgeInsets.all(MegamartSize.defaultSpace),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //After image add

              // text tile & subtitle
              Text(
                MegamartText.verEmail,
                style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,
              ),
              const SizedBox(height: MegamartSize.spaceBetweenItems),
              Text(
                emial ??'',
                style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center,
              ),
              const SizedBox(height: MegamartSize.spaceBetweenItems),
              Text(
                MegamartText.confirmationEmailSubtitle,
                style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: MegamartSize.spaceBetweenItems),

              //button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerifiedManually(), 
                  child: Text(MegamartText.toContinue),
                  ),
                  ),
              const SizedBox(height: MegamartSize.spaceBetweenItems),

              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => controller.sendEmailVerification(),
                  child: Text(MegamartText.resendEmail),
                ),
              ),
            ],

          ),
          
          ),
      ),

    );
  }
}