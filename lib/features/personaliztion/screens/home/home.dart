import 'package:ecommerce_final_year_project/common/widgets/custom_shape/container/ptimary_header_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrrimaryHomeHeader(
              child: Column(
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
