import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class ECircularImage extends StatelessWidget {
  const ECircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImag = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = MegamartSize.sm,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImag;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        shape: BoxShape.circle, // ✅ container round
        color: backgroundColor ??
            (HelperFunction.isDarkMode(context)
                ? MegamartColors.black
                : MegamartColors.white),
      ),
      child: ClipOval(
        child: SizedBox(
          height: height,
          width: width,
          child: Image(
            fit: fit, // cover fills circle properly
            image: isNetworkImag
                ? NetworkImage(image)
                : AssetImage(image) as ImageProvider,
            color: overlayColor,
          ),
        ),
      ),
    );
  }
}
