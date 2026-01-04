import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class AppCircularContainer extends StatelessWidget {
  const AppCircularContainer({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.radius = MegamartSize.cardRadiusLg,
    this.child,
    this.backgroundColor = MegamartColors.white,
    this.margin,
    this.showBorder = false,
    this.borderColor, // Make this nullable
    this.borderWidth = 1,
    this.elevation = 0,
    this.shadowColor,
  });

  // ... other properties
  final Color? borderColor; // Changed to nullable
  final double borderWidth;
  final double elevation;
  final Color? shadowColor;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final double radius;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;
  
  final bool showBorder;
  
  @override
  Widget build(BuildContext context) {
    final isDarkMode = HelperFunction.isDarkMode(context);
    
    // Default border color based on theme
    final defaultBorderColor = isDarkMode 
        ? MegamartColors.white.withOpacity(0.5)
        : MegamartColors.darkGray.withOpacity(0.3);
    
    // Default background color based on theme
    final defaultBackgroundColor = backgroundColor == MegamartColors.white
        ? (isDarkMode ? MegamartColors.dark : MegamartColors.white)
        : backgroundColor;

    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: defaultBackgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder
            ? Border.all(
                color: borderColor ?? defaultBorderColor, // Use default if null
                width: borderWidth,
              )
            : null,
        boxShadow: elevation > 0
            ? [
                BoxShadow(
                  color: shadowColor ?? 
                      Colors.black.withOpacity(isDarkMode ? 0.3 : 0.1),
                  blurRadius: elevation * 2,
                  offset: Offset(0, elevation),
                ),
              ]
            : null,
      ),
      child: child,
    );
  }
}