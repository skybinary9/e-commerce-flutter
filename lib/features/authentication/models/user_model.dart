import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_final_year_project/utils/formatters/formatters.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture, required String username,
  });

  /// Full name
  String get fullName => '$firstName $lastName';

  /// Auto-generated username
  String get username =>
      'cwt_${firstName.toLowerCase()}${lastName.toLowerCase()}';

  /// Formatted phone number
  String get formattedPhoneNo =>
      MegamartFormatter.formatPhoneNumber(phoneNumber);

  /// Convert model to JSON (Firestore)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
    };
  }

  /// Create UserModel from Firestore snapshot
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();

    return UserModel(
      id: document.id,
      firstName: data?['firstName'] ?? '',
      lastName: data?['lastName'] ?? '',
      email: data?['email'] ?? '',
      username: data?['username']?? '',
      phoneNumber: data?['phoneNumber'] ?? '',
      profilePicture: data?['profilePicture'] ?? '',
    );
  }
}
