import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/constants/text_sring.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';


/// ---------------------------------------------------------------------------
/// 🟢 HEADER WIDGET
/// ---------------------------------------------------------------------------
class LoginHeader extends StatelessWidget {
  const LoginHeader();

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Logo
        Image(
          image: AssetImage(
            dark ? MegamartImages.lightlogo : MegamartImages.darklogo,
          ),
          height: 150,
        ),
        const SizedBox(height: MegamartSize.spaceBtwSection),
        Text(
          MegamartText.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: MegamartSize.sm),
        Text(
          MegamartText.loginSubTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}