
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class ERatingBarIndicator extends StatelessWidget {
  const ERatingBarIndicator({
    super.key,
    required this.rating,
    this.itemSize = 20,
  });

  final double rating;
  final double itemSize;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: itemSize,
      unratedColor: MegamartColors.grey,
      itemBuilder: (context, index) => const Icon(
        Iconsax.star,
        color: MegamartColors.primary,
      ),
    );
  }
}
