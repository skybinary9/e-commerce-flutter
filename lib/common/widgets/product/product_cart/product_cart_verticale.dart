import 'package:ecommerce_final_year_project/common/styles/shadow.dart';
import 'package:ecommerce_final_year_project/common/widgets/custom_shape/container/app_circular_container.dart';
import 'package:ecommerce_final_year_project/common/widgets/icon/e_icon.dart';
import 'package:ecommerce_final_year_project/common/widgets/images/e_rounded_images.dart';
import 'package:ecommerce_final_year_project/common/widgets/text/brand_title_text.dart';
import 'package:ecommerce_final_year_project/common/widgets/text/e_text_verify_icon.dart';
import 'package:ecommerce_final_year_project/common/widgets/text/price_text.dart';
import 'package:ecommerce_final_year_project/common/widgets/text/product_title.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductCartVertical extends StatelessWidget {
  const ProductCartVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);

    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          boxShadow: [EShadow.verticalProdutShadow],
          borderRadius: BorderRadius.circular(MegamartSize.productImageRadius),
          color: dark ? MegamartColors.darkerGray : MegamartColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // ✅ overflow safety
          children: [

            /// IMAGE SECTION
            AppCircularContainer(
              height: 180,
              padding: EdgeInsets.zero,
              radius: MegamartSize.productImageRadius,
              backgroundColor:
                  dark ? MegamartColors.dark : MegamartColors.light,
              child: Stack(
                children: [

                  const Positioned.fill(
                    child: ERoundImage(
                      imgeUrl: MegamartImages.mouse,
                      applyImageRadius: true,
                      fit: BoxFit.cover,
                    ),
                  ),

                  /// Sale Badge
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: MegamartSize.sm,
                        vertical: MegamartSize.xS,
                      ),
                      decoration: BoxDecoration(
                        color: MegamartColors.secondary.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '25%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(
                              color: MegamartColors.black,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ),

                  /// Wishlist Icon
                  const Positioned(
                    top: 8,
                    right: 8,
                    child: EcircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: MegamartSize.spaceBetweenItems / 2),

            /// PRODUCT DETAILS + PRICE
            Padding(
              padding: const EdgeInsets.all(MegamartSize.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const EText(
                    title: 'Mouse laptop',
                    smallSize: true,
                  ),

                  const SizedBox(height: MegamartSize.spaceBetweenItems / 2),

                  const EBrandTitleText(title: 'Green Nike Air Shoes'),

                  const SizedBox(height: MegamartSize.spaceBetweenItems / 2),

                  const ETexBranWithVerifyIcon(tilte: 'Nike'),

                  const SizedBox(height: MegamartSize.spaceBetweenItems),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      const ProductPriceText(price: '35.0'),

                      Container(
                        decoration: const BoxDecoration(
                          color: MegamartColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft:
                                Radius.circular(MegamartSize.cardRadiusMd),
                            bottomRight: Radius.circular(
                                MegamartSize.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                          width: MegamartSize.iconLg,
                          height: MegamartSize.iconLg,
                          child: Icon(
                            Iconsax.add,
                            color: MegamartColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
