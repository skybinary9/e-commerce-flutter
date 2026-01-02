import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class EcircularIcon extends StatelessWidget {
  const EcircularIcon({
    super.key,
    this.height, 
    this.width, 
    this.size = MegamartSize.lg, 
    required this.icon, 
    this.backgroundColor, 
    this.onPressed, 
    this.color,
  });

  
  final double ? height, width , size;
  final IconData icon;
  final Color ? backgroundColor;
  final VoidCallback? onPressed;
  final Color ? color ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
       decoration: BoxDecoration(
         
         color: backgroundColor != null 
         ? backgroundColor!
         : HelperFunction.isDarkMode(context)
         ? MegamartColors.black.withOpacity(0.9)
         : MegamartColors.white.withOpacity(0.9),
         borderRadius: BorderRadius.circular(100)
       ),
       child: IconButton(
        onPressed: onPressed,
         icon: Icon(icon),
         
       ),
     );
  }
}
