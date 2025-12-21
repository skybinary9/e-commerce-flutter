import 'package:ecommerce_final_year_project/common/widgets/custom_shape/container/primary_header_container.dart';
import 'package:ecommerce_final_year_project/common/widgets/custom_shape/container/serachbar.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/widget/home_appbar.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/device/megamart_device_utilty.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
               children: [
                //home appbar
                HomeAppBar(),
                SizedBox(height: MegamartSize.spaceBetweenItems,),
                //search bar
                AppBarSerachBarContainer(text: 'Sreach Product', icon: Iconsax.search_normal,),
                SizedBox(height: MegamartSize.spaceBetweenSections,),
                //category list
               ],
              
              ),
              
            ),
          ],
        ),
      )
    );
  }
}