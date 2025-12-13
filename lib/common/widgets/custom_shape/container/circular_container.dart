
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AppCircularcontainer extends StatelessWidget {
  const AppCircularcontainer({
    super.key,
    this.height = 400,
    this.width = 400,
    this.padding = 0,
    this.raduis = 400,
    this.backgroundcolor = MegamartColors.white,
  });

  final double? height;
  final double? width;
  final double? padding;
  final double? raduis;
  final Color? backgroundcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding!),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(raduis!),
        color: backgroundcolor,
      ),
    );
  }
}
