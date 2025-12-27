import 'package:ecommerce_final_year_project/data/repositories/authentication_repository.dart';
import 'package:ecommerce_final_year_project/utils/helpers/network_manager.dart';
import 'package:ecommerce_final_year_project/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_final_year_project/utils/popups/loaders.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController{
  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginformkey = GlobalKey<FormState>();

  Future <void> emailAndPasswordSignIn()async{
    try{
    //check the internet
    final isConnected = await NetworkManager.instance.isConnected();
    if(!isConnected){
      EAppScreenLoader.stopLoading();
      return;
      }

    //form validation
    if(!loginformkey.currentState!.validate()){
      EAppScreenLoader.stopLoading();
      return;
    }

    //Save the data if remember me
    if(rememberMe.value){
      localStorage.write('Remember_Me_Email', email.text.trim());
      localStorage.write('Remember_Me_Password', password.text.trim());
      
    }

    // ignore: unused_local_variable
    final userCredential = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());


    // Remove Loader
    EAppScreenLoader.stopLoading();

    //Redirect
    AuthenticationRepository.instance.screenRedirect();
    }catch(e){
      EAppScreenLoader.stopLoading();
      ELoader.errorSnackBar(title: 'On Snap', message: e.toString());

    }
    
    }
  
}