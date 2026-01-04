
import 'package:ecommerce_final_year_project/features/shop/screens/cart/cart.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartCounterIcon extends StatelessWidget {
  const CartCounterIcon({
    super.key, required this.iconColor, required this.onPressed,
  });
  final Color iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(onPressed: ()=> Get.to(()=> CartScreen()), icon: const Icon(Icons.shopping_bag, color: MegamartColors.white,)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: MegamartColors.black,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text('3', style: Theme.of(context).textTheme.labelLarge!.apply(color: MegamartColors.white, fontSizeFactor: 0.8),),
            ),
          ),
        )
    
      ],
    );
  }
}