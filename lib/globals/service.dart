import 'package:code_learn/launch.dart';
import 'package:code_learn/services/auth_service.dart';
import 'package:code_learn/services/course_service/course_service.dart';
import 'package:code_learn/services/discover_service/discover_service.dart';
import 'package:code_learn/services/lesson_service/lesson_service.dart';
import 'package:code_learn/services/local_storage_service.dart';
import 'package:code_learn/services/module_service/module_service.dart';
import 'package:code_learn/services/navigator_service/navigator_service.dart';
import 'package:code_learn/services/router/router.dart';
import 'package:code_learn/services/version_service.dart';
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

  register<LocalStorageService>(storage);
  register<DiscoverService>(DiscoverService());
  final authService = AuthService();
  await authService.init();

  register<AuthService>(authService);
  register<NavigatorService>(NavigatorService());
  register<RocketRouter>(RocketRouter());
  register<CourseService>(CourseService());
  register<ModuleService>(ModuleService());
  register<VersionService>(VersionService());
  register<LessonService>(LessonService());
}

void register<T extends Object>(T value) {
  GetIt.instance.registerSingleton<T>(value);
}
