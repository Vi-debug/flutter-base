import 'package:flutter_dotenv/flutter_dotenv.dart';

final host = dotenv.env['HOST'] ?? '';
final clientID = dotenv.env['CLIENT_ID'] ?? '';
final redirectUrl = dotenv.env['REDIRECT_URL'] ?? '';
