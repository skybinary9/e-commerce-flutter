import 'package:ecommerce_final_year_project/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/checkout/checkout.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EAppbar(
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showbackArrow: true,
      ),

      body: Padding(
        padding: EdgeInsets.all(MegamartSize.defaultSpace),

        child: ECartItem()
        ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(MegamartSize.defaultSpace),
        child: ElevatedButton(onPressed: ()=> Get.to(()=> const Checkout()), child: Text('Checkout \$265')),
      ),
    );
  }
}
