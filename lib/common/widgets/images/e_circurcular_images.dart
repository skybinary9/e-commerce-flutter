import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

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
    this.borderColor,
    this.borderWidth = 0,
    this.elevation = 0,
    this.onTap,
    this.onLongPress,
    this.errorWidget,
  });

  final String image;
  final double width;
  final double height;
  final double padding;
  final BoxFit fit;
  final bool isNetworkImage;
  final Color? backgroundColor;
  final Color? overlayColor;
  final Color? borderColor;
  final double borderWidth;
  final double elevation;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = HelperFunction.isDarkMode(context);
    
    // Determine the actual image to display
    final String effectiveImage = image.isNotEmpty 
        ? image 
        : MegamartImages.userimage;
    
    Widget imageWidget = Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor ?? 
            (isDarkMode ? MegamartColors.black : MegamartColors.white),
        border: borderWidth > 0
            ? Border.all(
                color: borderColor ?? 
                    (isDarkMode ? MegamartColors.white : MegamartColors.black),
                width: borderWidth,
              )
            : null,
        boxShadow: elevation > 0
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(isDarkMode ? 0.3 : 0.1),
                  blurRadius: elevation * 2,
                  offset: Offset(0, elevation),
                ),
              ]
            : null,
      ),
      child: ClipOval(
        child: _buildImageWidget(context, effectiveImage),
      ),
    );

    // Add gesture support if needed
    if (onTap != null || onLongPress != null) {
      imageWidget = GestureDetector(
        onTap: onTap,
        onLongPress: onLongPress,
        child: imageWidget,
      );
    }

    return imageWidget;
  }

  Widget _buildImageWidget(BuildContext context, String effectiveImage) {
    if (isNetworkImage) {
      return Image.network(
        effectiveImage,
        fit: fit,
        color: overlayColor,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded / 
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return _buildErrorWidget(context);
        },
      );
    } else {
      try {
        return Image.asset(
          effectiveImage,
          fit: fit,
          color: overlayColor,
        );
      } catch (e) {
        // If asset loading fails, show error widget
        return _buildErrorWidget(context);
      }
    }
  }

  Widget _buildErrorWidget(BuildContext context) {
    return errorWidget ?? Image.asset(
      MegamartImages.userimage,
      fit: fit,
      color: overlayColor,
    );
  }
}