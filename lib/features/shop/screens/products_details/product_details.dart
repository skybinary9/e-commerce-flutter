import 'package:ecommerce_final_year_project/common/widgets/images/e_rounded_images.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/home/widget/curved_adge_widget.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/products_details/widget/image_product_slide.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/products_details/widget/product_meta.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/products_details/widget/rating_share.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1- product image slider
            EProductImageSlider(),
            /// 2- products details
            Padding(
              padding: EdgeInsets.only(left: MegamartSize.defaultSpace, bottom: MegamartSize.defaultSpace,right: MegamartSize.defaultSpace),
              child: Column(
                children: [
                  /// Rating & Store
                  const Rating(),
                     
                  /// Price, Title, stock And brand
                  ProductMetaData(),
                  /// Atrributes
                  /// Checkout Button
                  /// Description
                  /// Review
                
                ],
              ),
            )
           
          ],
        ),
      ),
    );
  }
}
