import 'package:ecommerce_final_year_project/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_final_year_project/features/personaliztion/controllers/updat_name_controller.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdatNameController());
    return Scaffold(
      appBar: EAppbar(title: Text('Chnage Name'), showbackArrow: true,),
      body: Padding(padding: const EdgeInsets.all(MegamartSize.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Use real name of easy verification. This name will appear on server page", 
          style: Theme.of(context).textTheme.labelMedium,),
          const SizedBox(height: MegamartSize.spaceBetweenItems,),
          Form(
            key: controller.updateUserNameFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.firstName,
                  validator: (value)=>MegartValidator.validateEmptyText('First Name', value),
                  expands: false,
                  decoration: const InputDecoration(labelText: 'First Name', prefixIcon: Icon(Iconsax.user)),
                ),
                const SizedBox(height: MegamartSize.spaceBetweenItems,),
                TextFormField(
                  controller: controller.lastName,
                  validator: (value)=>MegartValidator.validateEmptyText('Last Name', value),
                  expands: false,
                  decoration: const InputDecoration(labelText: 'Last Name', prefixIcon: Icon(Iconsax.user)),
                ),
              ],
            )
           ),const SizedBox(height: MegamartSize.spaceBetweenItems,),
           SizedBox(width: double.infinity,
           child: ElevatedButton(onPressed: ()=>controller.updateUserName(), child: const Text("Save")),
           ),
        ],
      ),
      ),
    );
  }
}