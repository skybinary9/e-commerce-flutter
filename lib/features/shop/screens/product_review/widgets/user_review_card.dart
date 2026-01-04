import 'package:ecommerce_final_year_project/common/widgets/custom_shape/container/app_circular_container.dart';
import 'package:ecommerce_final_year_project/common/widgets/product/rating_review/rating_review.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:read_more_text/read_more_text.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// ---------------- USER INFO ----------------
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(MegamartImages.userimage),
                ),
                const SizedBox(width: MegamartSize.spaceBetweenItems),
                Text(
                  'John',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Iconsax.more_circle),
            ),
          ],
        ),

        const SizedBox(height: MegamartSize.sm),

        /// ---------------- RATING + DATE ----------------
        Row(
          children: [
            ERatingBarIndicator(rating: 4),
            const SizedBox(width: MegamartSize.spaceBetweenItems),
            Text(
              '1 Nov, 2023',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),

        const SizedBox(height: MegamartSize.spaceBetweenItems),

        /// ---------------- REVIEW TEXT ----------------
        ReadMoreText(
          'This product offers reliable performance, ease of use, and a clean, modern design for everyday needs. This product offers reliable performance, ease of use, and a clean, modern design for everyday needs.',
          numLines: 2,
          readMoreText: 'Show more',
          readLessText: 'Less',
          readMoreTextStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: MegamartColors.primary,
          ),
        ),

        const SizedBox(height: MegamartSize.spaceBetweenItems),

        /// ---------------- STORE REPLY ----------------
        AppCircularContainer(
          backgroundColor:
              dark ? MegamartColors.darkerGray : MegamartColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(MegamartSize.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Megamart Store",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      '1 Nov, 2023',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
