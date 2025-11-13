import 'package:ecommerce_final_year_project/common/widgets/login_signup/success_screen/success_screen.dart';
import 'package:ecommerce_final_year_project/features/authentication/screens/login/login.dart';
import 'package:ecommerce_final_year_project/features/authentication/screens/login/widget/login_footer.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/constants/text_sring.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () =>Get.offAll(() => LoginScreen()), icon: const Icon(CupertinoIcons.clear),),
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
                "skybinary9@gmail.com",
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
                  onPressed: () => Get.to(() => SuccessScreen()),
                  child: Text(MegamartText.toContinue),
                ),
              ),
              const SizedBox(height: MegamartSize.spaceBetweenItems),

              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    // Action on button press
                  },
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