import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_final_year_project/features/shop/models/category_model.dart';
import 'package:ecommerce_final_year_project/utils/popups/loaders.dart';

class CategoryRepository {
  static final CategoryRepository _instance = CategoryRepository._internal();
  factory CategoryRepository() => _instance;
  CategoryRepository._internal();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Fetch all featured categories (where IsFeatured = true)
  Future<List<CategoryModel>> getFeaturedCategories() async {
    try {
      final querySnapshot = await _db
          .collection('Categories')
          .where('IsFeatured', isEqualTo: true)
          .limit(6)
          .get();

      return querySnapshot.docs
          .map((doc) => CategoryModel.fromQuerySnapshot(doc))
          .toList();
    } catch (e) {
      ELoader.errorSnackBar(
        title: 'Error',
        message: 'Error fetching featured categories: $e',
      );
      return [];
    }
  }

  /// Fetch all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final querySnapshot = await _db.collection('Categories').get();
      return querySnapshot.docs
          .map((doc) => CategoryModel.fromQuerySnapshot(doc))
          .toList();
    } catch (e) {
      ELoader.errorSnackBar(
        title: 'Error',
        message: 'Error fetching all categories: $e',
      );
      return [];
    }
  }

  /// Fetch sub-categories for a parent category
  Future<List<CategoryModel>> getSubCategories(String parentId) async {
    try {
      final querySnapshot = await _db
          .collection('Categories')
          .where('ParentId', isEqualTo: parentId)
          .get();

      return querySnapshot.docs
          .map((doc) => CategoryModel.fromQuerySnapshot(doc))
          .toList();
    } catch (e) {
      ELoader.errorSnackBar(
        title: 'Error',
        message: 'Error fetching sub-categories: $e',
      );
      return [];
    }
  }

  /// Fetch single category by ID
  Future<CategoryModel> getCategoryById(String categoryId) async {
    try {
      final docSnapshot = await _db
          .collection('Categories')
          .doc(categoryId)
          .get();

      if (docSnapshot.exists) {
        return CategoryModel.fromSnapshot(docSnapshot);
      } else {
        return CategoryModel.empty();
      }
    } catch (e) {
      ELoader.errorSnackBar(
        title: 'Error',
        message: 'Error fetching category by ID: $e',
      );
      return CategoryModel.empty();
    }
  }

  /// Upload image to Cloudinary and save category to Firebase
  Future<void> uploadCategoryWithImage({
    required String name,
    required String imagePath,
    required String parentId,
    required bool isFeatured,
  }) async {
    try {
      // First upload image to Cloudinary
      final imageUrl = await _uploadToCloudinary(imagePath);

      // Then save category to Firebase
      final category = CategoryModel(
        name: name,
        image: imageUrl,
        parentId: parentId,
        isFeatured: isFeatured,
      );

      await _db.collection('Categories').add(category.toJson());
    } catch (e) {
      ELoader.errorSnackBar(
        title: 'Error',
        message: 'Error uploading category: $e',
      );
      rethrow;
    }
  }

  /// Helper method to upload image to Cloudinary
  Future<String> _uploadToCloudinary(String imagePath) async {
    // Note: You'll need to implement Cloudinary upload logic
    // This is a placeholder implementation

    const cloudName = 'dqosjhlcw';
    // ignore: unused_local_variable
    const uploadPreset = 'categories';

    // For now, return a placeholder
    return 'https://res.cloudinary.com/$cloudName/image/upload/v1/categories/placeholder';
  }
}
