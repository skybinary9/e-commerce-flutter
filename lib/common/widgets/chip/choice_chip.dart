import 'package:ecommerce_final_year_project/common/widgets/custom_shape/container/app_circular_container.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class EChoiceChip extends StatelessWidget {
  const EChoiceChip({
    super.key, 
    required this.text, 
    required this.selescted, 
    this.onSelected,
  });

  final String text;
  final bool selescted;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor =  HelperFunction.getColor(text)!=null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label:isColor? const SizedBox(): Text(text), 
        selected: selescted, onSelected: onSelected,
      labelStyle: TextStyle(color: selescted? MegamartColors.white : null),
      avatar: isColor?  AppCircularContainer(width: 50, height: 50, backgroundColor: HelperFunction.getColor(text)! ) : null,
      shape: isColor? CircleBorder(): null,
      labelPadding: isColor? EdgeInsets.all(0): null,
      padding: isColor? EdgeInsets.all(0): null,
      backgroundColor: isColor?   HelperFunction.getColor(text)! :null,
      
      ),
    );
  }
}