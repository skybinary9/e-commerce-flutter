import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/constants/text_sring.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
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
              //heading
              Text(MegamartText.resetPassword, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height: MegamartSize.spaceBetweenItems),
              //subheading  
              Text(MegamartText.subheadingForgetPassword, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
              const SizedBox(height: MegamartSize.spaceBetweenItems),
              //submit button
              SizedBox(
              width: double.infinity,
            child: ElevatedButton(onPressed: ()=>Get.off(ResetPassword()), child: Text("Done")),),
            const SizedBox(height: MegamartSize.spaceBetweenItems),
            
            SizedBox(
              width: double.infinity,
              child: TextButton(onPressed: (){}, child: Text("Resend Email")))


            ],
        
        ),
        
        ),
      ),
    );
  }
}