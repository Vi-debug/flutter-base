import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get fileName =>
      kReleaseMode ? ".env.production" : ".env.staging";
  static String get host => dotenv.env['HOST'] ?? '';
  static String get clientID => dotenv.env['CLIENT_ID'] ?? '';
  static String get redirectUrl => dotenv.env['REDIRECT_URL'] ?? '';
}
