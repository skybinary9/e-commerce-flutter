import 'package:ecommerce_final_year_project/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_final_year_project/common/widgets/images/e_circurcular_images.dart';
import 'package:ecommerce_final_year_project/features/personaliztion/screens/profile/widget/profilemenu.dart';
import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/text/headertext.dart';

class PofileScreen extends StatelessWidget {
  const PofileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              ProfileMenu(OnPressed: () {  }, title: 'Name',vlaue: 'condint with t',),
              ProfileMenu(OnPressed: () {  }, title: 'Name',vlaue: 'condint with t',),
              const SizedBox(height: MegamartSize.spaceBetweenItems,),
              const Divider(),
              const SizedBox(height: MegamartSize.spaceBetweenItems),
              const SectionHeading(title: 'Personal Information', showactionButton: false,),
              const SizedBox(height: MegamartSize.spaceBetweenItems,),
              ProfileMenu(OnPressed: () {  }, title: 'UserId',vlaue: '4345',),
              ProfileMenu(OnPressed: () {  }, title: 'Email',vlaue: 'skybinary9@gmail.com',),
              ProfileMenu(OnPressed: () {  }, title: 'Phone Number',vlaue: '03248520295',),
              ProfileMenu(OnPressed: () {  }, title: 'Gender',vlaue: 'Male',),
              ProfileMenu(OnPressed: () {  }, title: 'Date of birth',vlaue: '10, Aug, 2002',),
              const Divider(),
              const SizedBox(height: MegamartSize.spaceBetweenItems),
              Center(child: TextButton(
                onPressed: (){}, child: const Text("Close Account", style: TextStyle(color: Colors.red),),),)




            ],
          ),
        ),
        ),
    );
  }
}