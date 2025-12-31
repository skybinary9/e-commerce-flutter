import 'package:ecommerce_final_year_project/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_final_year_project/common/widgets/images/e_circurcular_images.dart';
import 'package:ecommerce_final_year_project/features/personaliztion/controllers/user_controlller.dart';
import 'package:ecommerce_final_year_project/features/personaliztion/screens/profile/widget/change_name.dart';
import 'package:ecommerce_final_year_project/features/personaliztion/screens/profile/widget/profilemenu.dart';
import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/text/headertext.dart';

class PofileScreen extends StatelessWidget {
  const PofileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final contoller = UserControlller.instance;
    return Scaffold(
      appBar: EAppbar(
        showbackArrow: true, title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(MegamartSize.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const ECircularImage(image: MegamartImages.userimage, width: 80, height: 80,),
                    TextButton(onPressed: (){}, child: const Text("Change Profile Picture"),),
                  ],
                ),
              ),
              const SizedBox(height: MegamartSize.spaceBetweenItems/2,),
              const Divider(),
              const SizedBox(height: MegamartSize.spaceBetweenItems),
              const SectionHeading(title: 'Profile Information', showactionButton: false,),
              const SizedBox(height: MegamartSize.spaceBetweenItems),
              ProfileMenu(onPressed: ()=> Get.to(()=> const ChangeName()), title: 'Name', vlaue: contoller.user.value.fullName,),
              ProfileMenu(onPressed: () {  }, title: 'UserName', vlaue: contoller.user.value.username,),
              const SizedBox(height: MegamartSize.spaceBetweenItems,),
              const Divider(),
              const SizedBox(height: MegamartSize.spaceBetweenItems),
              const SectionHeading(title: 'Personal Information', showactionButton: false,),
              const SizedBox(height: MegamartSize.spaceBetweenItems,),
              ProfileMenu(onPressed: () {  }, title: 'UserId',vlaue: contoller.user.value.id, icon: Iconsax.copy,),
              ProfileMenu(onPressed: () {  }, title: 'Email',vlaue: contoller.user.value.email,),
              ProfileMenu(onPressed: () {  }, title: 'Ph.No',vlaue: contoller.user.value.phoneNumber,),
              ProfileMenu(onPressed: () {  }, title: 'Gender',vlaue: 'Male',),
              ProfileMenu(onPressed: () {  }, title: 'DOB',vlaue: '10, Aug, 2002',),
              const Divider(),
              const SizedBox(height: MegamartSize.spaceBetweenItems),
              Center(child: TextButton(
                onPressed: ()=> contoller.deleteAccountWarningPopup(), child: const Text("Close Account", style: TextStyle(color: Colors.red),),),)




            ],
          ),
        ),
        ),
    );
  }
}