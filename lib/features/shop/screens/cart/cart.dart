import 'package:ecommerce_final_year_project/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_final_year_project/common/widgets/cart/cart_items.dart';
import 'package:ecommerce_final_year_project/common/widgets/cart/product_quantity.dart';
import 'package:ecommerce_final_year_project/common/widgets/text/price_text.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:flutter/material.dart';

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

        child: ListView.separated(
          itemCount: 15,
          shrinkWrap: true,
          separatorBuilder: (_, __) =>
              const SizedBox(height: MegamartSize.spaceBetweenSections),

          itemBuilder: (_, index) =>
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// CART ITEM
                  const CartItems(),

                  const SizedBox(height: MegamartSize.spaceBetweenItems),

                  /// QUANTITY ROW
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 70,),
                          ProductQuantity(),
                        ],
                      ),
                      ///Product price text
                      ProductPriceText(price: '256',)
                    ],
                  ),
                  
                ],
              ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(MegamartSize.defaultSpace),
        child: ElevatedButton(onPressed: (){}, child: Text('Checkout \$265')),
      ),
    );
  }
}
