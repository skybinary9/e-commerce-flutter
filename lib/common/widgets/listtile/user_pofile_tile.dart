import 'package:ecommerce_final_year_project/common/widgets/images/e_circurcular_images.dart';
import 'package:ecommerce_final_year_project/features/personaliztion/controllers/user_controlller.dart';
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
    final contoller = UserControlller.instance;
    return ListTile(
      leading: ECircularImage(
        image: MegamartImages.userimage,
        height: 56,
        width: 56,
        padding: 0,
      ),
      title: Text(
        contoller.user.value.fullName
        ,style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: MegamartColors.white),
      ),
      subtitle: Text(
        contoller.user.value.email,
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
