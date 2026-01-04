import 'package:ecommerce_final_year_project/common/styles/shadow.dart';
import 'package:ecommerce_final_year_project/common/widgets/custom_shape/container/app_circular_container.dart';
import 'package:ecommerce_final_year_project/common/widgets/icon/e_icon.dart';
import 'package:ecommerce_final_year_project/common/widgets/images/e_rounded_images.dart';
import 'package:ecommerce_final_year_project/common/widgets/text/brand_title_text.dart';
import 'package:ecommerce_final_year_project/common/widgets/text/e_text_verify_icon.dart';
import 'package:ecommerce_final_year_project/common/widgets/text/price_text.dart';
import 'package:ecommerce_final_year_project/common/widgets/text/product_title.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/products_details/product_details.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetails()),
      child: Container(
        width: 310,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [EShadow.horizontalProdutShadow],
          borderRadius: BorderRadius.circular(MegamartSize.productImageRadius),
          color: dark ? MegamartColors.darkerGray : MegamartColors.white,
        ),
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// IMAGE SECTION
            AppCircularContainer(
              //width: 120,
              height: 120,
              padding: const EdgeInsets.all(MegamartSize.sm),
              radius: MegamartSize.productImageRadius,
              backgroundColor: dark ? MegamartColors.dark : MegamartColors.light,
              child: Stack(
                children: [
                  /// Product Image
                   SizedBox(
                    height: 120,
                    width: 120,
                     child: ERoundImage(
                        imgeUrl: MegamartImages.mouse,
                        applyImageRadius: true,
                      ),
                   ),

                  /// Sale Badge
                  Positioned(
                    top: 12,
                    child: AppCircularContainer(
                      radius: MegamartSize.sm,
                      backgroundColor: MegamartColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: MegamartSize.sm,
                        vertical: MegamartSize.xS,
                      ),
                      child: Text(
                        '25%',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: MegamartColors.black,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ),

                  /// Wishlist Icon
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: EcircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                      size: MegamartSize.iconSm,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: MegamartSize.spaceBetweenItems),

            /// PRODUCT DETAILS SECTION
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Product Title and Brand
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const EText(
                        title: 'Wireless Gaming Mouse Laptop Computer',
                        smallSize: true,
                        maxlines: 2,
                      ),

                      const SizedBox(height: MegamartSize.spaceBetweenItems / 4),

                      const EBrandTitleText(title: 'Green es'),

                      const SizedBox(height: MegamartSize.spaceBetweenItems / 4),

                      const ETexBranWithVerifyIcon(tilte: 'Nike'),

                      const SizedBox(height: MegamartSize.spaceBetweenItems / 2),
                    ],
                  ),

                  /// Price and Add to Cart Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const ProductPriceText(price: '35.0'),

                      /// Add to Cart Button
                      Container(
                        decoration: BoxDecoration(
                          color: MegamartColors.dark,
                          borderRadius: BorderRadius.circular(MegamartSize.sm),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Iconsax.add,
                            color: MegamartColors.white,
                            size: MegamartSize.iconSm,
                          ),
                          padding: const EdgeInsets.all(MegamartSize.xS),
                          constraints: const BoxConstraints(),
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