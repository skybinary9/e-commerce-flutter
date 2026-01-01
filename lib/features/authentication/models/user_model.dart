import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_final_year_project/utils/formatters/formatters.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String profilePicture;
  String username;

  // ✅ NEW FIELDS
  String dateOfBirth;
  String gender;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
    required this.username,
    required this.dateOfBirth,
    required this.gender,
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

      // ✅ NEW
      'dateOfBirth': dateOfBirth,
      'gender': gender,
    };
  }

  /// Create UserModel from Firestore snapshot
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      return UserModel(
        id: document.id,
        firstName: data['firstName'] ?? '',
        lastName: data['lastName'] ?? '',
        email: data['email'] ?? '',
        username: data['username'] ?? '',
        phoneNumber: data['phoneNumber'] ?? '',
        profilePicture: data['profilePicture'] ?? '',

        // ✅ SAFE DEFAULTS
        dateOfBirth: data['dateOfBirth'] ?? '',
        gender: data['gender'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }

  /// Empty user model
  static UserModel empty() => UserModel(
        id: '',
        firstName: '',
        lastName: '',
        email: '',
        phoneNumber: '',
        profilePicture: '',
        username: '',
        dateOfBirth: '',
        gender: '',
      );
}
