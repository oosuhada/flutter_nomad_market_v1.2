import 'package:flutter/foundation.dart';

import 'logger.dart';

class ErrorHandler {
  static void handleError(dynamic error, StackTrace stackTrace) {
    Logger.error('An error occurred: $error');
    if (kDebugMode) {
      print('Stack trace: $stackTrace');
    }
    // Add error reporting service integration here
  }

  static Future<T> runWithErrorHandling<T>(
      Future<T> Function() operation) async {
    try {
      return await operation();
    } catch (e, stackTrace) {
      handleError(e, stackTrace);
      rethrow;
    }
  }
}
