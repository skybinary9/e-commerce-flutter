import 'package:ecommerce_final_year_project/data/repositories/cetagory_repositry.dart';
import 'package:ecommerce_final_year_project/features/shop/models/category_model.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  static CategoriesController get instance => Get.find();

  // Variables
  final isLoading = false.obs;
  final _categoryRepository = CategoryRepository();
  
  // List to store featured categories
  final featuredCategories = <CategoryModel>[].obs;
  
  // List to store all categories
  final allCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedCategories();
    super.onInit();
  }

  /// Fetch featured categories
  Future<void> fetchFeaturedCategories() async {
    try {
      // Start loading
      isLoading.value = true;

      // Fetch categories from repository
      final categories = await _categoryRepository.getFeaturedCategories();

      // Update the list
      featuredCategories.assignAll(categories);
    } catch (e) {
      // Handle error
      print('Error fetching featured categories: $e');
      Get.snackbar(
        'Error',
        'Failed to load categories. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      // Stop loading
      isLoading.value = false;
    }
  }

  

  /// Fetch all categories
  Future<void> fetchAllCategories() async {
    try {
      // Start loading
      isLoading.value = true;
      // Fetch categories from repository
      final categories = await _categoryRepository.getAllCategories();

      // Update the list
      allCategories.assignAll(categories);
    } catch (e) {
      // Handle error
      print('Error fetching all categories: $e');
      Get.snackbar(
        'Error',
        'Failed to load categories. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      // Stop loading
      isLoading.value = false;
    }
  }

  /// Get sub-categories for a parent category
  Future<List<CategoryModel>> getSubCategories(String parentId) async {
    try {
      return await _categoryRepository.getSubCategories(parentId);
    } catch (e) {
      print('Error fetching sub-categories: $e');
      return [];
    }
  }

  /// Get category by ID
  Future<CategoryModel> getCategoryById(String categoryId) async {
    try {
      return await _categoryRepository.getCategoryById(categoryId);
    } catch (e) {
      print('Error fetching category by ID: $e');
      return CategoryModel.empty();
    }
  }

  /// Upload new category with image
  Future<void> uploadCategory({
    required String name,
    required String imagePath,
    required String parentId,
    required bool isFeatured,
  }) async {
    try {
      isLoading.value = true;
      
      await _categoryRepository.uploadCategoryWithImage(
        name: name,
        imagePath: imagePath,
        parentId: parentId,
        isFeatured: isFeatured,
      );

      // Refresh categories list
      await fetchFeaturedCategories();
      
      Get.snackbar(
        'Success',
        'Category uploaded successfully!',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      print('Error uploading category: $e');
      Get.snackbar(
        'Error',
        'Failed to upload category. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
      throw e;
    } finally {
      isLoading.value = false;
    }
  }

  /// Search categories by name
  List<CategoryModel> searchCategories(String query) {
    if (query.isEmpty) return [];
    
    return allCategories.where((category) {
      return category.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  /// Get featured categories for home screen
  List<CategoryModel> getFeaturedCategoriesForHome() {
    if (featuredCategories.length > 6) {
      return featuredCategories.sublist(0, 6);
    }
    return featuredCategories;
  }
}