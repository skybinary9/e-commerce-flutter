import 'package:flutter/material.dart';

class ShimarLoader extends StatelessWidget {
  const ShimarLoader({
    super.key,
    this.width = double.infinity,
    this.height = 16,
    this.radius = 8,
  });

  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey.shade300, // ✅ NEVER null
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}

