import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AppCircularContainer extends StatelessWidget {
  const AppCircularContainer({
    super.key,
    this.width = 400,
    this.height = 400,  
    this.padding = 0,
    this.radius = 400,
    this.child,
    this.backgroundColor = MegamartColors.white,
  });
  final double? width;
  final double? height;
  final double padding;
  final double radius;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}