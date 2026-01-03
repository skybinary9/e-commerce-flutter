import 'package:ecommerce_final_year_project/common/widgets/text/headertext.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/product_review/product_review.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/products_details/widget/product_attirbutes.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/products_details/widget/bottom_add_to_cart.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/products_details/widget/image_product_slide.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/products_details/widget/product_meta.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/products_details/widget/rating_share.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:read_more_text/read_more_text.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final dark = HelperFunction.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: BottomAddToCart(),
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
                  Rating(),
                     
                  /// Price, Title, stock And brand
                  ProductMetaData(),
                  /// Atrributes
                  ProductAttirbutes(),
                  const SizedBox(height: MegamartSize.spaceBetweenSections),
                  /// Checkout Button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, 
                  child: Text("Checkout"))),
                  const SizedBox(height: MegamartSize.spaceBetweenSections),               
                  /// Description
                  SectionHeading(title: 'Description', showactionButton: false,),
                  const SizedBox(height: MegamartSize.spaceBetweenItems),
                  ReadMoreText('This product offers reliable performance, ease of use, and a clean, modern design for everyday needs. his product offers reliable performance, ease of use, and a clean, modern design for everyday needs. his product offers reliable performance, ease of use, and a clean, modern design for everyday needs. his product offers reliable performance, ease of use, and a clean, modern design for everyday needs', 
                  numLines: 2,
                   readMoreText: 'Show more', readLessText: 'Less',
                   readMoreTextStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800 ),
                   readMoreIconColor: MegamartColors.primary,
                  ),
                  /// Review
                  Divider(),
                  const SizedBox(height: MegamartSize.spaceBetweenItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SectionHeading(title: 'Review(199)', showactionButton: false,),
                      IconButton(onPressed: ()=> Get.to(()=> const ProductReview()), icon: Icon(Icons.arrow_circle_right))
                    ],
                  ),
                  const SizedBox(height: MegamartSize.spaceBetweenSections),


                ],
              ),
            )
           
          ],
        ),
      ),
    );
  }
}
