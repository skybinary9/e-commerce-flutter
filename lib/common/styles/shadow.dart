import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class EShadow {
  static final verticalProdutShadow = BoxShadow(
    color: MegamartColors.darkGray.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  static final horizontalProdutShadow = BoxShadow(
    color: MegamartColors.darkGray.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}