class FormatExceptionHandler {
  /// Default message
  static String message() {
    return 'Invalid data format. Please check your input.';
  }

  /// Custom message support
  static String custom(String error) {
    return error;
  }

  /// Common format error mapper (optional use)
  static String fromCode(String code) {
    switch (code) {

      /* ---------------- Input Format ---------------- */
      case 'invalid-email-format':
        return 'The email address format is invalid.';
      case 'invalid-phone-format':
        return 'The phone number format is invalid.';
      case 'invalid-password-format':
        return 'Password format is invalid.';

      /* ---------------- Parsing ---------------- */
      case 'json-parsing-error':
        return 'Failed to parse server response.';
      case 'type-mismatch':
        return 'Data type mismatch occurred.';

      /* ---------------- Default ---------------- */
      default:
        return 'Invalid format detected. Please try again.';
    }
  }
}
