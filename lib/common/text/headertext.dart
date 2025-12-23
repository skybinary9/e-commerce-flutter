

import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key, required this.title, this.buttonTitle = "View All", this.textColor, this.showactionButton = true, this.onButtonTap,
  });

  final String title, buttonTitle;
  final Color? textColor;
  final bool showactionButton;
  final void Function()? onButtonTap;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text( title, 
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: textColor), 
        maxLines: 1, overflow: TextOverflow.ellipsis,),
        if (showactionButton) TextButton(onPressed: onButtonTap, child: Text( buttonTitle,))
      ],
    );
  }
}