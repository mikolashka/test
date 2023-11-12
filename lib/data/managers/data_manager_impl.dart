import 'package:devtools_test/data/managers/data_manager.dart';
import 'package:devtools_test/data/managers/secure_storage/secure_storage_data_source.dart';

class DataManagerImpl extends DataManager {
  final SecureStorageDataSource secureStorageDataSource;

  DataManagerImpl({required this.secureStorageDataSource});

  static const _storageKeyToken = 'devtools_test_access_token';
  static const _storageKeyId= 'devtools_test_user_id';

  @override
  Future<String?> getToken() async {
    return await secureStorageDataSource.read(key: _storageKeyToken);
  }

  @override
  Future<void> saveAuthToken(String token) async {
    secureStorageDataSource.write(key: _storageKeyToken, value: token);
  }

  @override
  Future<void> saveUserId(String id) async {
    secureStorageDataSource.write(key: _storageKeyId, value: id);
  }

  @override
  Future<String?> getUserId() async {
    return await secureStorageDataSource.read(key: _storageKeyId);
  }
}
