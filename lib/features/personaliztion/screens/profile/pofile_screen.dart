import 'package:ecommerce_final_year_project/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_final_year_project/common/widgets/images/e_circurcular_images.dart';
import 'package:ecommerce_final_year_project/data/repositories/user_repository.dart';
import 'package:ecommerce_final_year_project/features/personaliztion/controllers/user_controlller.dart';
import 'package:ecommerce_final_year_project/features/personaliztion/screens/profile/widget/change_name.dart';
import 'package:ecommerce_final_year_project/features/personaliztion/screens/profile/widget/change_username.dart';
import 'package:ecommerce_final_year_project/features/personaliztion/screens/profile/widget/profilemenu.dart';
import 'package:ecommerce_final_year_project/features/personaliztion/screens/profile/widget/update_email.dart';
import 'package:ecommerce_final_year_project/utils/constants/megamart_images.dart';
import 'package:ecommerce_final_year_project/utils/constants/size.dart';
import 'package:ecommerce_final_year_project/utils/helpers/helper_function.dart';
import 'package:ecommerce_final_year_project/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/text/headertext.dart';

class PofileScreen extends StatelessWidget {
  const PofileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserControlller.instance;
    bool isPicking = false;

    return Scaffold(
      appBar: const EAppbar(
        showbackArrow: true,
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MegamartSize.defaultSpace),
          child: Column(
            children: [

              /// ================= PROFILE IMAGE =================
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final image = controller.user.value.profilePicture;

                      return ECircularImage(
                        image: image.isNotEmpty ? image : MegamartImages.userimage,
                        width: 80,
                        height: 80,
                        isNetworkImage: image.isNotEmpty,
                        backgroundColor: Colors.grey.shade300,
                        overlayColor: Colors.white,
                      );
                    }),

                    const SizedBox(height: 8),

                    TextButton(
                      onPressed: () async {
                        if (isPicking) return; // prevent double tap
                        isPicking = true;

                        final url = await UserRepository.instance.pickUploadAndSaveProfileImage();

                        if (url != null) {
                          // Update local Rx user object
                          controller.user.update((val) {
                            val?.profilePicture = url;
                          });

                          ELoader.successSnackBar(
                            title: 'Success',
                            message: 'Profile picture updated',
                          );
                        } else {
                          ELoader.errorSnackBar(
                            title: 'Error',
                            message: 'Failed to update profile picture',
                          );
                        }

                        isPicking = false;
                      },
                      child: const Text("Change Profile Picture"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: MegamartSize.spaceBetweenItems / 2),
              const Divider(),
              const SizedBox(height: MegamartSize.spaceBetweenItems),

              /// ================= PROFILE INFO =================
              const SectionHeading(
                title: 'Profile Information',
                showactionButton: false,
              ),
              const SizedBox(height: MegamartSize.spaceBetweenItems),

              Obx(() => ProfileMenu(
                    onPressed: () => Get.to(() => const ChangeName()),
                    title: 'Name',
                    vlaue: controller.user.value.fullName,
                  )),

              Obx(() => ProfileMenu(
                    onPressed: () => Get.to(() => const ChangeUsernameScreen()),
                    title: 'UserName',
                    vlaue: controller.user.value.username,
                  )),

              const SizedBox(height: MegamartSize.spaceBetweenItems),
              const Divider(),
              const SizedBox(height: MegamartSize.spaceBetweenItems),

              /// ================= PERSONAL INFO =================
              const SectionHeading(
                title: 'Personal Information',
                showactionButton: false,
              ),
              const SizedBox(height: MegamartSize.spaceBetweenItems),

              Obx(() => ProfileMenu(
                    onPressed: () {
                      HelperFunction.copyUserId(controller.user.value.id);
                    },
                    title: 'UserId',
                    vlaue: controller.user.value.id,
                    icon: Iconsax.copy,
                  )),

              Obx(() => ProfileMenu(
                    onPressed: () => Get.to(() => UpdateEmailScreen()),
                    title: 'Email',
                    vlaue: controller.user.value.email,
                  )),

              Obx(() => ProfileMenu(
                    onPressed: () {},
                    title: 'Ph.No',
                    vlaue: controller.user.value.phoneNumber,
                  )),

              Obx(() => ProfileMenu(
                    onPressed: () {},
                    title: 'Gender',
                    vlaue: controller.user.value.gender.isNotEmpty
                        ? controller.user.value.gender
                        : 'Not set',
                  )),

              Obx(() => ProfileMenu(
                    onPressed: () {},
                    title: 'DOB',
                    vlaue: controller.user.value.dateOfBirth.isNotEmpty
                        ? controller.user.value.dateOfBirth
                        : 'Not set',
                  )),

              const Divider(),
              const SizedBox(height: MegamartSize.spaceBetweenItems),

              /// ================= DELETE ACCOUNT =================
              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text(
                    "Close Account",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
