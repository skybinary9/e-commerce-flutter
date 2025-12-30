import 'package:ecommerce_final_year_project/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_final_year_project/common/widgets/icon/e_icon.dart';
import 'package:ecommerce_final_year_project/common/widgets/layout/gridveiw.dart';
import 'package:ecommerce_final_year_project/common/widgets/product/product_cart/product_cart_verticale.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/home/home.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EAppbar(
        title: Text("Whishlist", style: Theme.of(context).textTheme.headlineSmall,),
        actions: [
          EcircularIcon(icon: Iconsax.add, onPressed: ()=> Get.to(HomeScreen()),)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MegamartSize.defaultSpace),
          child: Column(
            children: [
              EGridView(itemCount: 4, mainAxisExtent: 330,itemBuilder: (_, index) => const ProductCartVertical(),)
            ],
          ),
        ),
      ),
    );
  }
}