import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class EAppLoaderWidget extends StatelessWidget {
  const EAppLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min, // ⭐ VERY IMPORTANT
        children: [
          SizedBox(
            height: 200, // ✅ FIXED SAFE HEIGHT
            child: Lottie.asset(
              animation,
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(height: MegamartSize.defaultSpace),

          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),

          if (showAction && actionText != null) ...[
            const SizedBox(height: MegamartSize.defaultSpace),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: onActionPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: MegamartColors.dark,
                ),
                child: Text(
                  actionText!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: MegamartColors.light),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
