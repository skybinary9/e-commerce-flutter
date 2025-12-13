
import 'package:ecommerce_final_year_project/common/widgets/custom_shape/container/circular_container.dart';
import 'package:ecommerce_final_year_project/common/widgets/custom_shape/curved_edge/curved_edge_widget.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class PrrimaryHomeHeader extends StatelessWidget {
  const PrrimaryHomeHeader({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return HomeHeaderClipper(
      child: Container(
        color: MegamartColors.primary,
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: AppCircularcontainer(
                  backgroundcolor:
                      MegamartColors.white.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: -100,
                right: -300,
                child: AppCircularcontainer(
                  backgroundcolor:
                      MegamartColors.white.withOpacity(0.1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

