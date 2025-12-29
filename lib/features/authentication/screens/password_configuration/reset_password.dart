import 'package:ecommerce_final_year_project/features/authentication/controllers/forgetpassword/forgetpassword_controller.dart';
import 'package:ecommerce_final_year_project/features/authentication/screens/login/login.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/constants/text_sring.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.back(), icon: Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(MegamartSize.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //images of 60% width
              Text(email, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center,),
              const SizedBox(height: MegamartSize.spaceBetweenItems),
              //heading
              Text(MegamartText.resetPassword, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height: MegamartSize.spaceBetweenItems),
              //subheading  
              Text(MegamartText.subheadingForgetPassword, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
              const SizedBox(height: MegamartSize.spaceBetweenItems),
              //submit button
              SizedBox(
              width: double.infinity,
            child: ElevatedButton(onPressed: ()=> Get.offAll(()=> const LoginScreen()), child: Text("Done")),),
            const SizedBox(height: MegamartSize.spaceBetweenItems),
            
            SizedBox(
              width: double.infinity,
              child: TextButton(onPressed: () {ForgetPasswordController.instance.resendPasswordResetEmail(email);}, child: Text("Resend Email")))


            ],
        
        ),
        
        ),
      ),
    );
  }
}