import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static Future<void> saveAccessToken(String accessToken) async {
    await _storage.write(key: 'accessToken', value: accessToken);
  }

  static Future<void> saveRefreshToken(String refreshToken) async {
    await _storage.write(key: 'refreshToken', value: refreshToken);
  }

  static Future<String?> readAccessToken() async {
    return _storage.read(key: 'accessToken');
  }

  static Future<String?> readRefreshToken() async {
    return _storage.read(key: 'refreshToken');
  }
}
