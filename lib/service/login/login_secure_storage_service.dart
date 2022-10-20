import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginSecureStorage {
  static const _secureStorage = FlutterSecureStorage();

  static const _keyLoginEmail = 'loginEmail';
  static const _keyLoginPassword = 'loginPassword';
  static const _keyLoginServer = 'loginServer';
  static const _keyLoginToken = 'loginToken';

  static Future setLoginEmail(String email) async =>
      await _secureStorage.write(key: _keyLoginEmail, value: email);

  static Future<String?> getLoginEmail() async =>
      await _secureStorage.read(key: _keyLoginEmail);

  static Future setLoginPassword(String password) async =>
      await _secureStorage.write(key: _keyLoginPassword, value: password);

  static Future<String?> getLoginPassword() async =>
      await _secureStorage.read(key: _keyLoginPassword);

  static Future setLoginServer(String server) async =>
      await _secureStorage.write(key: _keyLoginServer, value: server);

  static Future<String?> getLoginServer() async =>
      await _secureStorage.read(key: _keyLoginServer);

  static Future setLoginToken(String token) async =>
      await _secureStorage.write(key: _keyLoginToken, value: token);

  static Future<String?> getLoginToken() async =>
      await _secureStorage.read(key: _keyLoginToken);

  static Future<void> setLoginData(
      String email, String password, String server) async {
    await LoginSecureStorage.setLoginEmail(email);
    await LoginSecureStorage.setLoginPassword(password);
    await LoginSecureStorage.setLoginServer(server);
  }
}
