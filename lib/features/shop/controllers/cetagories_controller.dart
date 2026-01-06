import 'package:ecommerce_final_year_project/data/repositories/cetagory_repositry.dart';
import 'package:ecommerce_final_year_project/features/shop/models/category_model.dart';
import 'package:ecommerce_final_year_project/utils/popups/loaders.dart';
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
      isLoading.value = true;
      final categories = await _categoryRepository.getFeaturedCategories();
      featuredCategories.assignAll(categories);
    } catch (e) {
      ELoader.errorSnackBar(
        title: 'Error',
        message: 'Failed to load featured categories. Please try again.',
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// Fetch all categories
  Future<void> fetchAllCategories() async {
    try {
      isLoading.value = true;
      final categories = await _categoryRepository.getAllCategories();
      allCategories.assignAll(categories);
    } catch (e) {
      ELoader.errorSnackBar(
        title: 'Error',
        message: 'Failed to load categories. Please try again.',
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// Get sub-categories for a parent category
  Future<List<CategoryModel>> getSubCategories(String parentId) async {
    try {
      return await _categoryRepository.getSubCategories(parentId);
    } catch (e) {
      ELoader.errorSnackBar(
        title: 'Error',
        message: 'Failed to load sub-categories. Please try again.',
      );
      return [];
    }
  }

  /// Get category by ID
  Future<CategoryModel> getCategoryById(String categoryId) async {
    try {
      return await _categoryRepository.getCategoryById(categoryId);
    } catch (e) {
      ELoader.errorSnackBar(
        title: 'Error',
        message: 'Failed to load category. Please try again.',
      );
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

      ELoader.successSnackBar(
        title: 'Success',
        message: 'Category uploaded successfully!',
      );
    } catch (e) {
      ELoader.errorSnackBar(
        title: 'Error',
        message: 'Failed to upload category. Please try again.',
      );
      rethrow;
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
