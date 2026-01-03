import 'package:ecommerce_final_year_project/common/widgets/images/e_rounded_images.dart';
import 'package:ecommerce_final_year_project/common/widgets/text/e_text_verify_icon.dart';
import 'package:ecommerce_final_year_project/common/widgets/text/product_title.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// PRODUCT IMAGE
        ERoundImage(
          imgeUrl: MegamartImages.latop,
          width: 60,
          height: 60,
          padding: EdgeInsets.all(MegamartSize.sm),
          backgrounColor: HelperFunction.isDarkMode(context)
              ? MegamartColors.darkerGray
              : MegamartColors.light,
        ),

        const SizedBox(width: MegamartSize.spaceBetweenSections),

        /// TEXT SECTION
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// BRAND + VERIFY ICON
              const ETexBranWithVerifyIcon(
                tilte: 'Nike',
              ),

              const SizedBox(height: 4),

              /// PRODUCT TITLE
              const EText(
                title: "Black Sports Shoes",
                maxlines: 1,
              ),

              const SizedBox(height: 6),

              /// COLOR + SIZE
              Text(
                "Color: Green   Size: UK 08",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
