import 'package:ecommerce_final_year_project/common/widgets/images/e_circurcular_images.dart';
import 'package:ecommerce_final_year_project/utils/constants/colors.dart';
import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
    required this.onEditTap,
  });

  final VoidCallback onEditTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ECircularImage(
        image: MegamartImages.userimage,
        height: 56,
        width: 56,
        padding: 0,
      ),
      title: Text(
        "Muhammad Shoaib",
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: MegamartColors.white),
      ),
      subtitle: Text(
        "skybinary9@gmail.com",
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .apply(color: MegamartColors.white),
      ),
      trailing: IconButton(
        onPressed: onEditTap,
        icon: const Icon(Iconsax.edit, color: MegamartColors.white),
      ),
    );
  }
}
