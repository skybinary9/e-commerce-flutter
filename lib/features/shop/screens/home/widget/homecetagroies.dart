
import 'package:ecommerce_final_year_project/common/widgets/images_text/images_text.dart';
import 'package:flutter/material.dart';

class HomeCetagories extends StatelessWidget {
  const HomeCetagories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80, // required height
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return EVerticalImagesText(images: '', title: 'Shoes', onTap: (){},);
        },
      ),
    );
  }
}
