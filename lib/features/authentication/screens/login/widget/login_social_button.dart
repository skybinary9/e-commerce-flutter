import 'package:ecommerce_final_year_project/features/authentication/controllers/login/login_controller.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SocialButtons extends StatelessWidget {

  const SocialButtons({
    super.key,
   
  });

  @override
  Widget build(BuildContext context) {
    final _ = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(decoration: BoxDecoration(border: Border.all(color: MegamartColors.grey),
        borderRadius: BorderRadius.circular(100)),
        child: IconButton(onPressed: ()async {
          await Get.find<LoginController>().googleSignIn();},
        icon: const Image(
          height: MegamartSize.iconMd,
          width: MegamartSize.iconMd,
          image: AssetImage(MegamartImages.google))),
          ),
          /*const SizedBox(width: MegamartSize.spaceBetweenItems,),
          Container(
            decoration: BoxDecoration(border: Border.all(color: MegamartColors.grey),
        borderRadius: BorderRadius.circular(100)),
        child: IconButton(onPressed:()
         async {Get.find<LoginController>().facebookSignIn();}, icon: const Image(
          height: MegamartSize.iconMd,
          width: MegamartSize.iconMd,
          image: AssetImage(MegamartImages.facebook))),
          )*/
        ],
        );  
  }
}