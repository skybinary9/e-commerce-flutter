// ignore_for_file: file_names
import 'package:ecommerce_final_year_project/common/widgets/chip/choice_chip.dart';
import 'package:ecommerce_final_year_project/common/widgets/custom_shape/container/app_circular_container.dart';
import 'package:ecommerce_final_year_project/common/widgets/text/headertext.dart';
import 'package:ecommerce_final_year_project/common/widgets/text/price_text.dart';
import 'package:ecommerce_final_year_project/common/widgets/text/product_title.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class ProductAttirbutes extends StatelessWidget {
  const ProductAttirbutes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark =  HelperFunction.isDarkMode(context);
    return Column(
      children: [
        AppCircularContainer(
          padding: EdgeInsets.all(MegamartSize.md),
          backgroundColor: dark ? MegamartColors.darkerGray : MegamartColors.grey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// title, price and stock status
            Row(
              children: [
                const SectionHeading(title: 'Variation', showactionButton: false,),
                SizedBox(width: MegamartSize.spaceBetweenItems,),
                Column(
                  children: [
                Row(
                  children: [
                     EText(title: 'Price :', smallSize: true,),
                    SizedBox(width: MegamartSize.spaceBetweenItems,),
                    Text('\$37', 
                    style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
                    
                SizedBox(width: MegamartSize.spaceBetweenItems,),
                // sale price
                ProductPriceText(price: '30',),

                  ],
                ),
                /// Stocl
                Row(
                  children: [
                    const EText(title: 'Stock :', smallSize: true,),
                    const SizedBox(width:  MegamartSize.spaceBetweenItems,),
                    Text('In stock', style: Theme.of(context).textTheme.titleMedium),
                  ],
                )
                  ],
                ),
              ],
            ),
            /// variation description
            const EText(title: 'This product offers reliable performance, ease of use, and a clean, modern design for everyday needs. :', 
            smallSize: true,
            maxlines: 4,
            ),
            
          ],
        ),
        ),
        const SizedBox(height: MegamartSize.spaceBetweenItems,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(title: 'Colors', showactionButton: false,),
            const SizedBox(height: MegamartSize.spaceBetweenItems/2),
             Wrap(
               spacing: 8,
              children: [
                EChoiceChip(text: 'Green', selescted: true, onSelected: (value){},),
                EChoiceChip(text: 'Blue', selescted: false, onSelected: (value){}),
                EChoiceChip(text: 'Yellow', selescted: false, onSelected: (value){}),
              ],
             )

          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(title: 'Size' , showactionButton: false,),
            const SizedBox(height: MegamartSize.spaceBetweenItems/2),
            Wrap(
               spacing: 5,
              children: [
                EChoiceChip(text: 'EU 34', selescted: true, onSelected: (value){},),
                EChoiceChip(text: 'EU 35', selescted: false, onSelected: (value){}),
                EChoiceChip(text: 'EU 35', selescted: false, onSelected: (value){})
              ],
             ),
          ],
        ),

        ],

    );
  }
}