import 'package:get/get.dart';
import '../http/http_client.dart';
import 'local_storage.dart';

class MegartAuthService {
  // Login user with email & password
  static Future<bool> login(String email, String password) async {
    try {
      // Send login request using your HTTP helper
      final response = await MegartHttpHelper.post(
        '/api/login',
        {'email': email, 'password': password},
      );

      // Check response
      if (response['status'] == 'success') {
        final token = response['token'];
        final user = response['user'];

        // Save token & user info locally
        await MegartLocalStorage.saveData('token', token);
        await MegartLocalStorage.saveData('user', user);

        return true; // Login successful
      } else {
        Get.snackbar('Login Failed', response['message'] ?? 'Invalid credentials');
        return false;
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong: $e');
      return false;
    }
  }

  // Logout user
  static Future<void> logout() async {
    await MegartLocalStorage.clearAllData();
    Get.offAllNamed('/login'); // Navigate to login screen
  }

  // Check if user is logged in
  static bool isLoggedIn() {
    final token = MegartLocalStorage.getData<String>('token');
    return token != null && token.isNotEmpty;
  }

  // Get current user info
  static Map<String, dynamic>? getUserInfo() {
    return MegartLocalStorage.getData<Map<String, dynamic>>('user');
  }
}
