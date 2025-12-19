import 'package:ecommerce_final_year_project/common/widgets/custom_shape/curved_edge/app_custom_curved_edge.dart';
import 'package:flutter/material.dart';

class CurvedEdgeWidget extends StatelessWidget {
  const CurvedEdgeWidget({
    super.key, this.child,
  });

  final Widget ? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: AppCustomCurvedEdge(), 
      child: child
    );
  }
}
