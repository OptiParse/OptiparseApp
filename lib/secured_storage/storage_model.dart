// storage.dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  // Create storage
  final storage = const FlutterSecureStorage();

  final String _jwtToken = 'username';

  // Singleton pattern
  static final SecureStorage _instance = SecureStorage._internal();

  factory SecureStorage() {
    return _instance;
  }

  SecureStorage._internal();

  Future setToken(String token) async {
    await storage.write(key: _jwtToken, value: token);
  }

  Future<String?> getToken() async {
    return await storage.read(key: _jwtToken);
  }

  Future deleteAllStorage() async{
    await storage.deleteAll() ;
  }

}