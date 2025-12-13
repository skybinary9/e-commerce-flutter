import 'package:ecommerce_final_year_project/common/widgets/custom_shape/curved_edge/curved_edge.dart';
import 'package:flutter/material.dart';

class HomeHeaderClipper extends StatelessWidget {
  const HomeHeaderClipper({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurvedEdge(),
      child: child,
    );
  }
}
