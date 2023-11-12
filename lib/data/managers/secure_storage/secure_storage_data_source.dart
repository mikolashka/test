import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract interface class SecureStorageDataSource {
  Future<void> write({required String key, required String value});
  Future<String?> read({required String key});
  Future<void> delete({required String key});
}

class SecureStorageDataSourceImpl implements SecureStorageDataSource {
  AndroidOptions _getAndroidOptions() => const AndroidOptions(encryptedSharedPreferences: true);

  late final _storage = FlutterSecureStorage(aOptions: _getAndroidOptions(),iOptions: const IOSOptions());

  @override
  Future<void> write({required String key, required String value}) async {
    try {
      await _storage.write(key: key, value: value);
    } on PlatformException catch (_) {
      rethrow;
    }
  }

  @override
  Future<String?> read({required String key}) async {
    try {
      return await _storage.read(key: key);
    } on PlatformException catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> delete({required String key}) async {
    try {
      await _storage.delete(key: key);
    } on PlatformException catch (_) {
      rethrow;
    }
  }

}
