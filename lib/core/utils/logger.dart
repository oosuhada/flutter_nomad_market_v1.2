import 'package:logger/logger.dart' as log;

class Logger {
  static final _logger = log.Logger();

  static void info(String message) {
    _logger.i(message);
  }

  static void warning(String message) {
    _logger.w(message);
  }

  static void error(String message) {
    _logger.e(message);
  }

  static void debug(String message) {
    _logger.d(message);
  }
}
