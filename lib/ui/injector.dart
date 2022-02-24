import 'package:code_learn/services/navigator_service/navigator_service.dart';
import 'package:get_it/get_it.dart';

void injectDependencies({NavigatorService? navigatorService}) {
  GetIt.instance.registerSingleton<NavigatorService>(
    navigatorService ?? NavigatorService(),
  );
}
