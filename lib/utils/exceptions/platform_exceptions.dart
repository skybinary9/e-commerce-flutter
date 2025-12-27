class PlatformExceptionHandler {
  final String code;

  PlatformExceptionHandler(this.code);

  /// Get readable error message
  String get message {
    switch (code) {

      /* ---------------- Permissions ---------------- */
      case 'PERMISSION_DENIED':
        return 'Permission denied. Please allow required permissions.';
      case 'location-permission-denied':
        return 'Location permission denied.';
      case 'camera-permission-denied':
        return 'Camera permission denied.';
      case 'microphone-permission-denied':
        return 'Microphone permission denied.';
      case 'storage-permission-denied':
        return 'Storage permission denied.';

      /* ---------------- Auth / Social Login ---------------- */
      case 'sign_in_failed':
        return 'Sign-in failed. Please try again.';
      case 'network_error':
        return 'Network error. Please check your internet connection.';
      case 'google-sign-in-cancelled':
        return 'Google sign-in was cancelled.';
      case 'facebook-sign-in-cancelled':
        return 'Facebook sign-in was cancelled.';

      /* ---------------- Firebase / MethodChannel ---------------- */
      case 'channel-error':
        return 'Communication error with native platform.';
      case 'unknown':
        return 'Unknown platform error occurred.';

      /* ---------------- File / Media ---------------- */
      case 'file-not-found':
        return 'Selected file was not found.';
      case 'invalid-file':
        return 'Invalid file selected.';
      case 'file-too-large':
        return 'Selected file is too large.';

      /* ---------------- Default ---------------- */
      default:
        return 'A platform error occurred. Please try again.';
    }
  }
}
