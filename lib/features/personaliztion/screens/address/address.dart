import 'package:ecommerce_final_year_project/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_final_year_project/common/widgets/custom_shape/container/app_circular_container.dart';
import 'package:ecommerce_final_year_project/features/personaliztion/screens/address/addressNewScreen.dart';
import 'package:ecommerce_final_year_project/features/personaliztion/screens/address/widget/single_address.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: ()=> Get.to(()=> Addressnewscreen()),
      child: const Icon(Iconsax.add, color: MegamartColors.white,),
      ),
      appBar: EAppbar(
        showbackArrow: true,
        title: Text("Addresses", style: Theme.of(context).textTheme.headlineSmall,),),
        body: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.all(MegamartSize.defaultSpace),
          child: Column(
            children: [
              ESingleAddress(selectedAddress: true,),
              ESingleAddress(selectedAddress: false,)
            ],
          ),
          ),
        ),
    );
  }
}