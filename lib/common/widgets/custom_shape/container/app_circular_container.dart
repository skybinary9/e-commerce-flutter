import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AppCircularContainer extends StatelessWidget {
  const AppCircularContainer({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.radius = 12,
    this.child,
    this.backgroundColor = MegamartColors.white,
    this.margin,
    this.showBorder = false,
    this.borderColor = Colors.white,
    this.borderWidth = 1,
  });

  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final double radius;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;

  /// 🔹 Border properties
  final bool showBorder;
  final Color borderColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder
            ? Border.all(
                color: borderColor,
                width: borderWidth,
              )
            : null,
      ),
      child: child,
    );
  }
}
