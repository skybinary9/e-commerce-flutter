import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:flutter/material.dart';

class ERoundImage extends StatelessWidget {
  const ERoundImage({
    super.key,
    this.width,
    this.height,
    this.border,
    this.fit = BoxFit.cover, // 🔥 default cover
    this.padding,
    this.isNetworkImage = false,
    this.applyImageRadius = true,
    this.onPressed,
    this.borderRadius = MegamartSize.md,
    required this.imgeUrl, 
    this.backgrounColor,
  });

  final double? width, height;
  final String imgeUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final BoxFit fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;
  final Color ? backgrounColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width, height: height, padding: padding,
        decoration: BoxDecoration(border: border, color: backgrounColor, borderRadius: BorderRadius.circular(borderRadius)),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Image(
            fit: fit,
            image: isNetworkImage
                ? NetworkImage(imgeUrl)
                : AssetImage(imgeUrl) as ImageProvider,
          ),
        ),
      ),
    );
  }
}
