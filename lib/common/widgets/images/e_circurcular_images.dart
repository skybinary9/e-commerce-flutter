import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class ECircularImage extends StatelessWidget {
  const ECircularImage({
    super.key,
    required this.image,
    this.width = 60,
    this.height = 60,
    this.fit = BoxFit.cover,
    this.isNetworkImage = false,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 0,
    this.onTap,
  });

  final String image;
  final double width;
  final double height;
  final BoxFit fit;
  final bool isNetworkImage;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderWidth;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunction.isDarkMode(context);

    final String finalImage =
        image.isNotEmpty ? image : MegamartImages.userimage;

    Widget avatar = Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor ??
            (isDark ? MegamartColors.black : MegamartColors.white),
        border: borderWidth > 0
            ? Border.all(
                color: borderColor ??
                    (isDark
                        ? MegamartColors.white
                        : MegamartColors.black),
                width: borderWidth,
              )
            : null,
      ),
      child: ClipOval(
        child: isNetworkImage
            ? Image.network(
                finalImage,
                fit: fit,
                errorBuilder: (_, __, ___) {
                  return Image.asset(
                    MegamartImages.userimage,
                    fit: fit,
                  );
                },
              )
            : Image.asset(
                finalImage,
                fit: fit,
              ),
      ),
    );

    return onTap != null
        ? GestureDetector(onTap: onTap, child: avatar)
        : avatar;
  }
}
