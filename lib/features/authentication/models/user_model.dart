import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_final_year_project/utils/formatters/formatters.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String email;
  String phoneNumber;
  String profilePicture;
  String username;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
    required this.username,
  });

  /// Full name
  String get fullName => '$firstName $lastName';

  /// Formatted phone number
  String get formattedPhoneNo =>
      MegamartFormatter.formatPhoneNumber(phoneNumber);

  /// Split full name correctly
  static List<String> nameParts(String fullName) =>
      fullName.trim().split(' ');

  /// Auto-generated username
  static String generateUsername(String fullName) {
    final parts = nameParts(fullName);

    final firstName = parts.isNotEmpty ? parts[0].toLowerCase() : '';
    final lastName = parts.length > 1 ? parts[1].toLowerCase() : '';

    return 'cwt_$firstName$lastName';
  }

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
      username: data?['username'] ?? '',
      phoneNumber: data?['phoneNumber'] ?? '',
      profilePicture: data?['profilePicture'] ?? '',
    );
  }
}
