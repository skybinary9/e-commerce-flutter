import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce_final_year_project/utils/popups/loaders.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

/// Manages network connectivity status
class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  final Rx<ConnectivityResult> _connectionStatus =
      ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(
      (List<ConnectivityResult> results) {
        if (results.isNotEmpty) {
          _updateConnectionStatus(results.last);
        }
      },
    );
  }

  /// Update connection status and show warning if no internet
  void _updateConnectionStatus(ConnectivityResult result) {
    _connectionStatus.value = result;

    if (result == ConnectivityResult.none) {
      ELoader.warningSnackBar(
        title: 'No Internet Connection',
        message: 'Please check your internet and try again.',
      );
    }
  }

  /// Check internet connection manually
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      return result != ConnectivityResult.none;
    } on PlatformException {
      return false;
    }
  }

  /// Dispose connectivity stream
  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }
}
