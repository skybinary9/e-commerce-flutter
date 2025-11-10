import 'package:ecommerce_final_year_project/features/authentication/screens/login/widget/login_social_button.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/constants/text_sring.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// 🟢 FOOTER WIDGET (Divider + Social Buttons)
/// ---------------------------------------------------------------------------
class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.only(top: MegamartSize.spaceBetweenSections),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Divider with text
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Divider(
                  color: dark ? MegamartColors.darkGray : MegamartColors.dGray,
                  thickness: 0.5,
                  indent: 60,
                  endIndent: 5,
                ),
              ),
              Text(
                MegamartText.signWith,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Flexible(
                child: Divider(
                  color: dark ? MegamartColors.darkGray : MegamartColors.dGray,
                  thickness: 0.5,
                  indent: 5,
                  endIndent: 60,
                ),
              ),
            ],
          ),

          const SizedBox(height: MegamartSize.spaceBetweenItems),

          /// Social Buttons (Google + Facebook)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SocialButton(image: MegamartImages.google),
              SizedBox(width: MegamartSize.spaceBetweenItems),
              SocialButton(image: MegamartImages.facebook),
            ],
          ),
        ],
      ),
    );
  }
}
