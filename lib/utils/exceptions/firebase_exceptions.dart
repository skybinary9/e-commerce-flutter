class FirebaseExceptionHandler {
  final String code;

  FirebaseExceptionHandler(this.code);

  /// Get readable error message
  String get message {
    switch (code) {

      /* ---------------- Firestore ---------------- */
      case 'permission-denied':
        return 'You do not have permission to perform this action.';
      case 'not-found':
        return 'The requested data was not found.';
      case 'already-exists':
        return 'This data already exists.';
      case 'resource-exhausted':
        return 'Quota exceeded. Please try again later.';
      case 'failed-precondition':
        return 'Operation failed due to invalid state.';
      case 'aborted':
        return 'Operation was aborted. Please retry.';
      case 'out-of-range':
        return 'Operation attempted out of allowed range.';
      case 'unimplemented':
        return 'This operation is not implemented.';
      case 'internal':
        return 'Internal server error. Please try again later.';
      case 'unavailable':
        return 'Service temporarily unavailable.';
      case 'data-loss':
        return 'Data loss occurred. Please contact support.';

      /* ---------------- Network ---------------- */
      case 'network-request-failed':
        return 'Network error. Please check your internet connection.';

      /* ---------------- Timeout ---------------- */
      case 'deadline-exceeded':
        return 'The request took too long. Please try again.';

      /* ---------------- Default ---------------- */
      default:
        return 'Something went wrong with Firebase. Please try again.';
    }
  }
}
