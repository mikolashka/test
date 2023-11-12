import 'package:devtools_test/data/managers/data_manager.dart';
import 'package:devtools_test/data/repository/repository.dart';
import 'package:devtools_test/data/repository/repository_impl.dart';
import 'package:get_it/get_it.dart';

import 'core/router/router_service.dart';
import 'data/managers/data_manager_impl.dart';
import 'data/managers/secure_storage/secure_storage_data_source.dart';

final getIt = GetIt.instance;

Future<void> setUpApp() async {
  setUpDependencies();
}
void setUpDependencies() {
  setUpRouter();
  setUpUtils();
  setUpManagers();
  setUpRepositories();
}

void setUpRouter() {
  getIt.registerLazySingleton<RouterService>(() => RouterService());
}

void setUpRepositories() {
  getIt.registerFactory<Repository>(
        () => RepositoryImpl(dataManager: getIt()),
  );
}

void setUpManagers(){
  getIt.registerFactory<DataManager>(
        () => DataManagerImpl(secureStorageDataSource: getIt()),
  );
}

void setUpUtils(){
  getIt.registerLazySingleton<SecureStorageDataSource>(
        () => SecureStorageDataSourceImpl(),
  );
}
