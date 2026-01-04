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

class ProductCartVertical extends StatelessWidget {
  const ProductCartVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(()=> const ProductDetails()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [EShadow.verticalProdutShadow],
          borderRadius: BorderRadius.circular(MegamartSize.productImageRadius),
          color: dark ? MegamartColors.darkerGray : MegamartColors.white,
        ),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisSize: MainAxisSize.min, // ✅ overflow safety
          children: [
            /// IMAGE SECTION
            AppCircularContainer(
              height: 180,
              padding: EdgeInsets.all(MegamartSize.sm),
              radius: MegamartSize.productImageRadius,
              backgroundColor:
                  dark ? MegamartColors.dark : MegamartColors.light,
              child: Stack(
                children: [

                  const Positioned.fill(
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
                        '25%', style: Theme.of(context).textTheme.labelLarge!.copyWith(
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
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: MegamartSize.spaceBetweenItems / 2),

            /// PRODUCT DETAILS + PRICE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: MegamartSize.sm),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const EText(
                      title: 'Mouse laptop',
                      smallSize: true,
                    ),
                
                    const SizedBox(height: MegamartSize.spaceBetweenItems / 2),
                
                    const EBrandTitleText(title: 'Green es'),
                
                    const SizedBox(height: MegamartSize.spaceBetweenItems / 2),
                
                    const ETexBranWithVerifyIcon(tilte: 'Nike'),
                
                    const SizedBox(height: MegamartSize.spaceBetweenItems),
                
                  ],
                ),
              ),
            ),
            const Spacer(),
            // Line 115-120 کے قریب مسئلہ:
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Padding(
      padding: const EdgeInsets.only(left: MegamartSize.sm),
      child: const ProductPriceText(price: '35.0'), // const ہٹا دیں
    ),
    const Spacer(),
    Container(
      decoration: BoxDecoration(
        color: MegamartColors.dark,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(MegamartSize.cardRadiusMd),
          bottomRight: Radius.circular(MegamartSize.productImageRadius),
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
            );
          }
        }
