import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_final_year_project/features/authentication/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

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
}
