import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelperFunction {
  // ✅ Returns color safely
  static Color? getColor(String value) {
    switch (value.toLowerCase()) {
      case 'green':
        return Colors.green;
      case 'red':
        return Colors.red;
      case 'blue':
        return Colors.blue;
      case 'pink':
        return Colors.pink;
      case 'grey':
        return Colors.grey;
      case 'purple':
        return Colors.purple;
      case 'black':
        return Colors.black;
      case 'white':
        return Colors.white;
      case 'brown':
        return Colors.brown;
      case 'teal':
        return Colors.teal;
      case 'indigo':
        return Colors.indigo;
      default:
        return null;
    }
  }

  // ✅ Shows snackbar safely (check if context is mounted)
  static void showSnackBar(String message) {
    final context = Get.context;
    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    } else {
      debugPrint('No context available for snackbar');
    }
  }

  // ✅ Shows alert dialog
  static void showAlert(String title, String message) {
    final context = Get.context;
    if (context == null) return;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  // ✅ Navigate to a new screen
  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  // ✅ Shorten long text
  static String truncateText(String text, int maxLength) {
    return (text.length <= maxLength)
        ? text
        : '${text.substring(0, maxLength)}...';
  }

  // ✅ Detect dark mode
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  // ✅ Get screen sizes safely
  static Size screenSize(BuildContext context) {
    return MediaQuery.of(Get.context!).size;
  }
  // ✅ Get screen height and width safely

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(Get.context!).size.height;
  }
  // ✅ Get screen width safely

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(Get.context!).size.width;
  }

  // ✅ Format date properly
  static String formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}-"
           "${date.month.toString().padLeft(2, '0')}-"
           "${date.year}";
  }

  // ✅ Remove duplicates from a list
  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  // ✅ Wrap widgets in rows (grid-like layout)
  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrapList = <Widget>[];
    for (int i = 0; i < widgets.length; i += rowSize) {
      int endIndex = (i + rowSize < widgets.length)
          ? i + rowSize
          : widgets.length;

      wrapList.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: widgets.sublist(i, endIndex),
        ),
      );
    }
    return wrapList;
  }
}
