import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String? id;
  final String name;
  final String image;
  final String parentId;
  final bool isFeatured;

  CategoryModel({
    this.id,
    required this.name,
    required this.image,
    required this.parentId,
    required this.isFeatured,
  });

  /// Empty Category
  static CategoryModel empty() => CategoryModel(
        id: '',
        name: '',
        image: '',
        parentId: '',
        isFeatured: false,
      );

  /// Convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'ParentId': parentId,
      'IsFeatured': isFeatured,
    };
  }

  /// Factory method to create a CategoryModel from a Firebase document snapshot
  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return CategoryModel(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        parentId: data['ParentId'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
      );
    } else {
      return CategoryModel.empty();
    }
  }

  /// Factory method to create a CategoryModel from a query document snapshot
  factory CategoryModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return CategoryModel(
      id: document.id,
      name: data['Name'] ?? '',
      image: data['Image'] ?? '',
      parentId: data['ParentId'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
    );
  }
}