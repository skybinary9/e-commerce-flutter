import 'package:ecommerce_final_year_project/utils/constants/enum.dart';
import 'package:flutter/material.dart';

class EBrandTitleText extends StatelessWidget {
  const EBrandTitleText({
    super.key, 
    required this.title, 
    this.maxLines = 1, 
    this.color, 
    this.textAlign = TextAlign.center, 
    this.brandTextSizes = TextSize.small,
  });
  final String title;
  final int maxLines;
  final Color ? color;
  final TextAlign ? textAlign;
  final TextSize brandTextSizes;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
            title,
            textAlign: textAlign,
            overflow: TextOverflow.ellipsis,
            maxLines: maxLines,
          style: brandTextSizes == TextSize.small
          ? Theme.of(context).textTheme.labelMedium!.apply(color: color) 
          : brandTextSizes == TextSize.medium
          ? Theme.of(context).textTheme.bodyLarge!.apply(color: color) 
          : brandTextSizes == TextSize.medium
          ? Theme.of(context).textTheme.titleLarge!.apply(color: color) 
          : Theme.of(context).textTheme.bodyMedium!.apply(color: color) 
          ),
          
          
        
      ],
    );
  }
}

