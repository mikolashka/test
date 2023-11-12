import 'package:devtools_test/data/repository/repository.dart';
import 'package:devtools_test/data/repository/repository_impl.dart';
import 'package:get_it/get_it.dart';

import 'core/router/router_service.dart';

final getIt = GetIt.instance;

Future<void> setUpApp() async {
  setUpDependencies();
}
void setUpDependencies() {
  setUpRouter();
  setUpRepositories();
}

void setUpRouter() {
  getIt.registerLazySingleton<RouterService>(() => RouterService());
}

void setUpRepositories() {
  getIt.registerFactory<Repository>(
        () => RepositoryImpl(),
  );
}