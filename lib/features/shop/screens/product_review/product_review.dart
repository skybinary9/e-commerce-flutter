import 'package:ecommerce_final_year_project/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_final_year_project/common/widgets/rating_review/rating_review.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/product_review/widgets/progress_rating_indicator.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/product_review/widgets/user_review_card.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class ProductReview extends StatelessWidget {
  const ProductReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      EAppbar(
        title: Text("Reviews & Ratings"), showbackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(MegamartSize.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Reviews & Ratings are verified and are from people who use the same type of device that can use"),
            SizedBox(height: MegamartSize.defaultSpace,),
            /// overall product rating
            const OverAllRatingProduct(),
            ERatingBarIndicator(rating: 5),
            const SizedBox(height: MegamartSize.spaceBetweenItems/2,),
            Text('12,611', style: Theme.of(context).textTheme.bodySmall,),
            const SizedBox(height: MegamartSize.spaceBetweenSections,),
            /// User Reviews list 
            UserReviewCard(),
          ],
        ),
        ),
      ),
    );
  }
}
