import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/constants/text_sring.dart';
import 'package:flutter/material.dart';

class TermsCondition extends StatelessWidget {
  const TermsCondition({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: true,
            onChanged: (value) {},
          ),
        ),
        const SizedBox(width: MegamartSize.defaultSpace),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: MegamartText.isAgreeTo,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextSpan(
                  text: MegamartText.privacyPolicy,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(
                        color: dark
                            ? MegamartColors.white
                            : MegamartColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark
                            ? MegamartColors.white
                            : MegamartColors.primary,
                      ),
                ),
                TextSpan(
                  text: MegamartText.and,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextSpan(
                  text: MegamartText.terms,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(
                        color: dark
                            ? MegamartColors.white
                            : MegamartColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark
                            ? MegamartColors.white
                            : MegamartColors.primary,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
