import 'package:ecommerce_final_year_project/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Addressnewscreen extends StatelessWidget {
  const Addressnewscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EAppbar(title: Text("Add New Address") ,showbackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(MegamartSize.defaultSpace),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(prefixIcon: Icon(Iconsax.user), label: Text('Name')),
              ),
              const SizedBox(height: MegamartSize.spaceBetweenInputFields,),
              TextFormField(
                decoration: InputDecoration(prefixIcon: Icon(Iconsax.mobile), label: Text('Phone Number')),
              ),
              const SizedBox(height: MegamartSize.spaceBetweenInputFields,),
              Row(children: [
                Expanded(
                  child: TextFormField(
                  decoration: InputDecoration(prefixIcon: Icon(Iconsax.building_31), label: Text('Street')),
                                ),
                ),
                const SizedBox(width: MegamartSize.spaceBetweenInputFields,),
                Expanded(
                  child: TextFormField(
                  decoration: InputDecoration(prefixIcon: Icon(Iconsax.code), label: Text('Postal Code')),
                                ),
                ),
              ],
              ),
              const SizedBox(height: MegamartSize.spaceBetweenInputFields,),
              Row(children: [
                Expanded(
                  child: TextFormField(
                  decoration: InputDecoration(prefixIcon: Icon(Iconsax.building_31), label: Text('City')),
                                ),
                ),
                const SizedBox(width: MegamartSize.spaceBetweenInputFields,),
                Expanded(
                  child: TextFormField(
                  decoration: InputDecoration(prefixIcon: Icon(Iconsax.activity), label: Text('State')),
                                ),
                ),
              ],
              ),
              const SizedBox(height: MegamartSize.spaceBetweenInputFields,),
              TextFormField(
                decoration: InputDecoration(prefixIcon: Icon(Iconsax.global), label: Text('Country')),
              ),
              const SizedBox(height: MegamartSize.spaceBetweenItems,),
              SizedBox(width: double.infinity, 
              child: ElevatedButton(onPressed: (){}, child: Text("save")),)
            ],
          ),
        ),
      ),
    );
  }
}