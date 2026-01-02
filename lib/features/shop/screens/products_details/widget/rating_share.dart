
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Rating extends StatelessWidget {
  const Rating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center, // important
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center, // important
          children: [
          Icon(Iconsax.star5, color: Colors.amber, size: 24,),
          SizedBox(width: MegamartSize.spaceBetweenItems/2,),
          Text.rich(TextSpan(children: [
          TextSpan(text: '5.0', style: Theme.of(context).textTheme.bodyLarge),
          const TextSpan(text: '(199)')
          ]
          )
          )
          ],
          ),
          IconButton(onPressed: (){}, 
       icon: const Icon(Iconsax.share, size: MegamartSize.iconMd,))
      ],
    );
  }
}
