import 'package:code_learn/globals/service.dart';
import 'package:code_learn/services/auth_service.dart';
import 'package:code_learn/services/navigator_service/navigator_service.dart';
import 'package:stacked/stacked.dart';

class AppModel extends BaseViewModel {
  NavigatorService get navigatorService => locate<NavigatorService>();
  final authService = locate<AuthService>();

  void init() async {
    runBusyFuture(Future(() async {}));
  }
}
