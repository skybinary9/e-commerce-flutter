import 'package:ecommerce_final_year_project/common/widgets/custom_shape/container/app_circular_container.dart';
import 'package:ecommerce_final_year_project/features/shop/screens/widget/curved_adge_widget.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:flutter/material.dart';



class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurvedEdgeWidget(
      child : Container(color: MegamartColors.primary, padding: const EdgeInsets.all(0),
      child: SizedBox( height: 400,
      child: Stack(
        children: [
          Positioned(top: -150, right: -250, child: AppCircularContainer(backgroundColor: MegamartColors.textWhite.withOpacity(0.1),)),
          Positioned(top: 100, right: -300, child: AppCircularContainer(backgroundColor: MegamartColors.textWhite.withOpacity(0.1),)),
          Center(child: child),
          ],
        ),
      ),
    ),
   );
  }
}
