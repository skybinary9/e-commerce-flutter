import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:flutter/material.dart';


/// ---------------------------------------------------------------------------
/// 🟢 Reusable Social Icon Button
/// ---------------------------------------------------------------------------
class SocialButton extends StatelessWidget {
  final String image;

  const SocialButton({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: MegamartColors.dGray),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Image(
          height: MegamartSize.iconMd,
          width: MegamartSize.iconMd,
          image: AssetImage(image),
        ),
      ),
    );
  }
}
