import 'package:ecommerce_final_year_project/data/repositories/user_repository.dart';
import 'package:ecommerce_final_year_project/features/authentication/models/user_model.dart';
import 'package:ecommerce_final_year_project/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserControlller extends GetxController{
  static UserControlller get instance => Get.find();

  final userRepository = Get.put(UserRepository());
  Future <void> saveUserRecord(UserCredential? userCredential)async{
    try{
      if(userCredential != null){
        final nameParts = UserModel.nameParts(userCredential.user!.displayName ?? "");
        final username  = UserModel.generateUsername(userCredential.user!.displayName ?? "");

        // Map Data
        final user = UserModel(
          id: userCredential.user!.uid, 
          firstName: nameParts[0], 
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join('') : '',
          email: userCredential.user!.email ?? '', 
          username: username,
          phoneNumber: userCredential.user!.phoneNumber ?? '', 
          profilePicture: userCredential.user!.photoURL ?? '', 
          
        );

        await userRepository.saveUserRecord(user);
      }

    }catch(e){
      ELoader.warningSnackBar(title: 'Data not somthing wrong while saving information. You can re-save your data profile');
    }
  }
}