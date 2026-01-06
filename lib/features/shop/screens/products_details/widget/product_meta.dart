import 'package:ecommerce_final_year_project/common/widgets/custom_shape/container/app_circular_container.dart';
import 'package:ecommerce_final_year_project/common/widgets/images/e_circurcular_images.dart';
import 'package:ecommerce_final_year_project/common/widgets/text/e_text_verify_icon.dart';
import 'package:ecommerce_final_year_project/common/widgets/text/price_text.dart';
import 'package:ecommerce_final_year_project/common/widgets/text/product_title.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/enum.dart';
import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:flutter/material.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            AppCircularContainer(
              radius: MegamartSize.sm,
              backgroundColor: MegamartColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                horizontal: MegamartSize.sm,
                vertical: MegamartSize.xS,
              ),
              child: Text(
                '25%',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: MegamartColors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: MegamartSize.spaceBetweenItems),

            ///price
            Text(
              '\$37',
              style: Theme.of(context).textTheme.titleSmall!.apply(
                decoration: TextDecoration.lineThrough,
              ),
            ),
            const SizedBox(width: MegamartSize.spaceBetweenItems),
            const ProductPriceText(price: '170', isLarge: true),
            const SizedBox(height: MegamartSize.spaceBetweenItems / 1.5),
          ],
        ),
        EText(title: "Green Nike Sports"),
        const SizedBox(height: MegamartSize.spaceBetweenItems / 1.5),
        Row(
          children: [
            EText(title: "Status"),
            const SizedBox(width: MegamartSize.spaceBetweenItems),
            Text('In stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: MegamartSize.spaceBetweenItems / 1.5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ECircularImage(
              image: MegamartImages.clothicon,
              height: 32,
              width: 32,
              //overlayColor: HelperFunction.isDarkMode(context)
              //? MegamartColors.white
              //: MegamartColors.black,
            ),

            const SizedBox(width: MegamartSize.spaceBetweenItems),

            ETexBranWithVerifyIcon(
              tilte: 'Nike',
              brandTextSizes: TextSize.medium,
            ),
          ],
        ),
      ],
    );
  }
}
