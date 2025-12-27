class FirebaseAuthExceptionHandler {
  final String code;

  FirebaseAuthExceptionHandler(this.code);

  /// Get readable error message
  String get message {
    switch (code) {

      /* ---------------- Registration Errors ---------------- */
      case 'email-already-in-use':
        return 'This email address is already registered.';
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'weak-password':
        return 'The password is too weak. Please use a stronger password.';
      case 'operation-not-allowed':
        return 'Email/password accounts are not enabled.';

      /* ---------------- Login Errors ---------------- */
      case 'user-not-found':
        return 'No account found with this email.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'user-disabled':
        return 'This account has been disabled.';
      case 'invalid-credential':
        return 'Invalid login credentials.';
      case 'too-many-requests':
        return 'Too many attempts. Please try again later.';

      /* ---------------- Email Verification ---------------- */
      case 'requires-recent-login':
        return 'Please re-login to continue this action.';
      case 'email-not-verified':
        return 'Please verify your email address first.';

      /* ---------------- Re-Authentication ---------------- */
      case 'credential-already-in-use':
        return 'This credential is already associated with another account.';
      case 'account-exists-with-different-credential':
        return 'An account already exists with a different sign-in method.';
      case 'provider-already-linked':
        return 'This login provider is already linked.';

      /* ---------------- Google / Facebook ---------------- */
      case 'popup-closed-by-user':
        return 'Login popup closed before completion.';
      case 'cancelled-popup-request':
        return 'Login process was cancelled.';
      case 'popup-blocked':
        return 'Popup was blocked by the browser.';
      case 'unauthorized-domain':
        return 'This domain is not authorized.';

      /* ---------------- Token / Session ---------------- */
      case 'user-token-expired':
        return 'Session expired. Please login again.';
      case 'invalid-user-token':
        return 'Invalid session. Please login again.';

      /* ---------------- Network ---------------- */
      case 'network-request-failed':
        return 'Network error. Please check your internet connection.';

      /* ---------------- Password Reset ---------------- */
      case 'expired-action-code':
        return 'This reset link has expired.';
      case 'invalid-action-code':
        return 'Invalid password reset link.';

      /* ---------------- Default ---------------- */
      default:
        return 'Authentication failed. Please try again.';
    }
  }
}
