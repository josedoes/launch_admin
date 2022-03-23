import 'package:code_learn/launch.dart';

import '../../globals/service.dart';
import '../../model/module.dart';
import '../router/router.dart';

DiscoverService get discoverService => locate<DiscoverService>();

class DiscoverService {
  Future<List<Module>> loadModules() async {
    try {
      final response = await router.get(endpoint: 'dart-modules');
      final modules = fromJsonToModule(response);
      return modules;
    } catch (e) {
      logger.e('error in loadModules $e');
      return [];
    }
  }

  List<Module> fromJsonToModule(dynamic listJson) {
    List<Module> modules = [];
    for (final json in listJson) {
      modules.add(Module.fromJson(json));
    }
    return modules;
  }
}
