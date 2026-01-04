import 'package:ecommerce_final_year_project/common/widgets/product/cart/cart_items.dart';
import 'package:ecommerce_final_year_project/common/widgets/product/cart/product_quantity.dart';
import 'package:ecommerce_final_year_project/common/widgets/text/price_text.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:flutter/material.dart';

class ECartItem extends StatelessWidget {
  const ECartItem({super.key,
  this.showAddRemoveButton = true});
  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
          itemCount: 2,
          shrinkWrap: true,
          separatorBuilder: (_, _) =>
              const SizedBox(height: MegamartSize.spaceBetweenSections),
              itemBuilder: (_, index) =>
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// CART ITEM
                  CartItems(),
                  if(showAddRemoveButton)const SizedBox(height: MegamartSize.spaceBetweenItems),

                  // / QUANTITY ROW
                  if(showAddRemoveButton)
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
        );

  }
}