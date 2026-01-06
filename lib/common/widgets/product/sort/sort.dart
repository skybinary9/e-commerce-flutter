// ignore_for_file: avoid_print

import 'package:ecommerce_final_year_project/common/widgets/layout/gridveiw.dart';
import 'package:ecommerce_final_year_project/common/widgets/product/product_cart/product_cart_verticale.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DropDownItems extends StatelessWidget {
  const DropDownItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// DropDown
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.sort),
            labelText: 'Sort By',
            border: OutlineInputBorder(),
          ),
          items:
              const [
                    'Name',
                    'Higher Price',
                    'Lower Price',
                    'Sale',
                    'Newest',
                    'Popularity',
                  ]
                  .map(
                    (option) => DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    ),
                  )
                  .toList(),
          onChanged: (value) {
            // Sorting logic here
            print(value);
          },
        ),
        const SizedBox(height: MegamartSize.defaultSpace),

        /// Products
        EGridView(
          itemCount: 4,
          mainAxisExtent: 305,
          itemBuilder: (_, index) => ProductCartVertical(),
        ),
      ],
    );
  }
}
