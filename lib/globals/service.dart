import 'package:code_learn/launch.dart';
import 'package:code_learn/services/auth_service.dart';
import 'package:code_learn/services/course_service/course_service.dart';
import 'package:code_learn/services/discover_service/discover_service.dart';
import 'package:code_learn/services/local_storage_service.dart';
import 'package:code_learn/services/module_service/module_service.dart';
import 'package:code_learn/services/navigator_service/navigator_service.dart';
import 'package:code_learn/services/router/router.dart';
import 'package:get_it/get_it.dart';

T locate<T extends Object>({
  String? instanceName,
  dynamic param1,
  dynamic param2,
}) {
  return GetIt.instance.get<T>();
}

Future<void> setUpLocator() async {
  lowLevelLog('setting up locator');

  final storage = LocalStorageService();
  await storage.init();
  GetIt.instance.registerSingleton<LocalStorageService>(storage);

  GetIt.instance.registerSingleton<DiscoverService>(DiscoverService());
  final authService = AuthService();
  await authService.init();

  GetIt.instance.registerSingleton<AuthService>(authService);
  GetIt.instance.registerSingleton<NavigatorService>(NavigatorService());
  GetIt.instance.registerSingleton<RocketRouter>(RocketRouter());
  GetIt.instance.registerSingleton<CourseService>(CourseService());
  GetIt.instance.registerSingleton<ModuleService>(ModuleService());
}
