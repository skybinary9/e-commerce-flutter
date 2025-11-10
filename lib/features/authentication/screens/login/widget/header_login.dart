import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/constants/text_sring.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// 🟢 LOGIN HEADER WIDGET (Final Polished Version)
/// ---------------------------------------------------------------------------
class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        /// 🖼️ Logo with fade animation
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          child: Image.asset(
            dark ? MegamartImages.darklogo : MegamartImages.lightlogo,
            key: ValueKey(dark), // ensures smooth logo switch on theme change
            height: MegamartSize.imageLg, // ✅ semantic size constant
          ),
        ),

        const SizedBox(height: MegamartSize.spaceBetweenSections),
        /// Title
        Text(
          MegamartText.loginTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: MegamartSize.sm),
        /// Subtitle
        Text(
          MegamartText.loginSubTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey.shade600,
              ),
        ),
      ],
    );
  }
}
