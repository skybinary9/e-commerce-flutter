import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class EVerticalImagesText extends StatelessWidget {
  const EVerticalImagesText({
    super.key, 
    required this.images, 
    required this.title, 
    this.textColor = MegamartColors.white, 
    this.backgroundColor, 
    this.onTap,
  });
  final String images, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          left: MegamartSize.spaceBetweenItems,
        ),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              padding:
                  const EdgeInsets.all(MegamartSize.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? (dark ? MegamartColors.dark : MegamartColors.light),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(image: AssetImage(images), fit: BoxFit.cover, color: textColor,), 
              ),
            ),
            const SizedBox(height: MegamartSize.spaceBetweenItems/2),
            // Category Title
            SizedBox(
              width: 60,
              child: Text(title, style: Theme.of(context).textTheme.labelMedium!.apply
              ( color: dark ? MegamartColors.white : MegamartColors.black,), 
              maxLines: 1, overflow: TextOverflow.ellipsis,),)
              
          ],
        ),
      ),
    );
  }
}
