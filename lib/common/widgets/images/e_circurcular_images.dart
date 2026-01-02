import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
//import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

/*class ECircularImage extends StatelessWidget {
  const ECircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = MegamartSize.sm,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
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
        shape: BoxShape.circle,
        color: backgroundColor ??
            (HelperFunction.isDarkMode(context)
                ? MegamartColors.black
                : MegamartColors.white),
      ),
      child: ClipOval(
        child: Image(
          fit: fit,
          image: isNetworkImage
              ? NetworkImage(image)
              : AssetImage(image),
          color: overlayColor,
        ),
      ),
    );
  }
}
*/

import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';

class ECircularImage extends StatelessWidget {
  const ECircularImage({
    super.key,
    required this.image,
    this.width = 50,
    this.height = 50,
    this.padding = MegamartSize.sm,
    this.fit = BoxFit.cover,
    this.isNetworkImage = false,
    this.backgroundColor,
    this.overlayColor,
  });
  final String image;
  final double width;
  final double height;
  final double padding;
  final Color? overlayColor;
  final BoxFit fit;
  final bool isNetworkImage;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor ??
            (HelperFunction.isDarkMode(context)
                ? MegamartColors.black
                : MegamartColors.white),
      ),
      child: ClipOval(
        child: isNetworkImage && image.isNotEmpty
            ? Image.network(
                image,
                fit: fit,
                // ignore: unnecessary_underscores
                errorBuilder: (_, __, ___) => Image.asset(
                  MegamartImages.userimage,
                  fit: fit,
                ),
              )
            : Image.asset(
                image.isNotEmpty ? image : MegamartImages.userimage,
                fit: fit,
                color: overlayColor,
              ),
      ),
    );
  }
}
