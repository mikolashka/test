abstract class DataManager{
  Future<String?> getToken();
  Future<void> saveAuthToken(String token);
  Future<String?> getUserId();
  Future<void> saveUserId(String id);
}