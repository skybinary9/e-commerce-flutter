import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_final_year_project/data/repositories/authentication_repository.dart';
import 'package:ecommerce_final_year_project/features/authentication/models/user_model.dart';
import 'package:ecommerce_final_year_project/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:ecommerce_final_year_project/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce_final_year_project/utils/exceptions/format_exceptions.dart';
import 'package:ecommerce_final_year_project/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

/// Repository class for user-related opration
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Save user data to Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'Authentication error';
    } on FirebaseException catch (e) {
      throw e.message ?? 'Firebase error';
    } on PlatformException catch (e) {
      throw e.message ?? 'Platform error';
    } on FormatException {
      throw 'Invalid format';
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Function to fetch user details based on user-id
   Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db.collection('Users').doc(AuthenticationRepository.instance.authUser?.uid).get();
      if (documentSnapshot.exists){
        return UserModel.fromSnapshot(documentSnapshot);
      }
      else {
        return UserModel.empty();
      }
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler(e.code).message;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } on PlatformException catch (e) {
      throw PlatformExceptionHandler(e.code).message;
    } on FormatException {
      throw FormatExceptionHandler.message();
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    } 
  }

  /// Function to update user data on firebase
  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db.collection("Users").doc(updatedUser.id).update(updatedUser.toJson());
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler(e.code).message;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } on PlatformException catch (e) {
      throw PlatformExceptionHandler(e.code).message;
    } on FormatException {
      throw FormatExceptionHandler.message();
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    } 
  }

  /// Update any field in specifc users collection on firebase
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).update(json);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler(e.code).message;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } on PlatformException catch (e) {
      throw PlatformExceptionHandler(e.code).message;
    } on FormatException {
      throw FormatExceptionHandler.message();
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    } 
  }

   /// Function to remove user the data from firestore
  Future<void> removeUserRecode(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler(e.code).message;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } on PlatformException catch (e) {
      throw PlatformExceptionHandler(e.code).message;
    } on FormatException {
      throw FormatExceptionHandler.message();
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    } 
  }
  
}
