import '../../services/secure_storage/secure_storage.dart';

class LoginRepository {
  final _secureStorage = SecureStorage.instance;

  void saveAcessToken(String accessToken) async {
    await _secureStorage.setTokenAuthen(accessToken);
  }

  Future<bool> hasAcessToken() async {
    final token = await _secureStorage.getApiKey();
    return token != null;
  }
}
