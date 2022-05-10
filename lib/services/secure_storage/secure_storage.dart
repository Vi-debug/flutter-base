import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_example/services/secure_storage/secure_storage_const.dart';

class SecureStorage {
  static final instance = SecureStorage._();

  SecureStorage._();

  static const _storage = FlutterSecureStorage();

  Future<String> getTokenAuthen() async {
    String token = await _storage.read(key: keyTokenAuth) ?? '';
    return token;
  }

  Future<void> setTokenAuthen(String value) async {
    await _storage.write(key: keyTokenAuth, value: value);
  }

  Future<String> getApiKey() async {
    String token = await _storage.read(key: apiKey) ?? '';
    return token;
  }

  Future<void> setApiKey(String value) async {
    await _storage.write(key: apiKey, value: value);
  }

  Future<void> deleteAllStorage() async {
    await _storage.deleteAll();
  }
}
