/*
import 'package:ecommerce_final_year_project/data/repositories/cetagory_repositry.dart';
import 'package:ecommerce_final_year_project/features/shop/models/category_model.dart';
import 'package:flutter/material.dart';

class TestCategoriesScreen extends StatelessWidget {
  const TestCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryModel.dummyCategories();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Categories'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(category.image),
              ),
              title: Text(category.name),
              subtitle: Text('ID: ${category.id} | Featured: ${category.isFeatured}'),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {
                  // Show sub-categories
                  final subCategories = CategoryModel.dummySubCategories(category.id);
                  if (subCategories.isNotEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Sub-categories of ${category.name}'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: subCategories
                              .map(
                                (subCat) => ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(subCat.image),
                                  ),
                                  title: Text(subCat.name),
                                  subtitle: Text('Parent: ${subCat.parentId}'),
                                ),
                              )
                              .toList(),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('No sub-categories for ${category.name}')),
                    );
                  }
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Test the repository
          final repo = CategoryRepository();
          
          showDialog(
            context: context,
            builder: (context) => FutureBuilder(
              future: repo.getFeaturedCategories(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text('Loading categories...'),
                      ],
                    ),
                  );
                }
                
                if (snapshot.hasError) {
                  return AlertDialog(
                    title: const Text('Error'),
                    content: Text(snapshot.error.toString()),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('OK'),
                      ),
                    ],
                  );
                }
                
                final categories = snapshot.data as List<CategoryModel>;
                
                return AlertDialog(
                  title: const Text('Repository Test'),
                  content: Text('Successfully loaded ${categories.length} categories'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            ),
          );
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}*/