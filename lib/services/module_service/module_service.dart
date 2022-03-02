import 'package:code_learn/globals/service.dart';
import 'package:code_learn/model/module.dart';
import 'package:code_learn/services/logger/logger.dart';

import '../router/router.dart';

ModuleService get moduleService => locate<ModuleService>();

class ModuleService {
  final moduleCache = <String, Map<String, Module>>{};

  List<Module> getModulesCacheModules({required String courseId}) {
    final modules = <Module>[];
    final items = moduleCache[courseId] ?? {};
    for (final module in items.values) {
      modules.add(module);
    }
    return modules;
  }

  void create({required double version, required String courseId}) async {
    try {
      final result = await router.post(endpoint: '/module/$version/$courseId');
      final module = Module.fromJson(result);
      moduleCache[module.courseId] = {module.id: module};
    } catch (e) {
      logError(e);
    }
  }

  void read({required String id}) async {
    try {
      final result = await router.get(endpoint: '/module/$id');
      final module = Module.fromJson(result);
      moduleCache[module.courseId] = {module.id: module};
    } catch (e) {
      logError(e);
    }
  }

  void update({required String id}) async {
    try {
      final result = await router.patch(endpoint: '/module/$id');
      final module = Module.fromJson(result);
      moduleCache[module.courseId] = {module.id: module};
    } catch (e) {
      logError(e);
    }
  }

  void delete({required id}) async {
    try {
      final result = await router.delete(endpoint: '/module/$id');
      final module = Module.fromJson(result);
      moduleCache[module.courseId]?.remove(module.id);
    } catch (e) {
      logError(e);
    }
  }

  void all() async {
    try {
      final result = await router.get(endpoint: '/module/');
      for (final json in result) {
        final module = Module.fromJson(json);
        moduleCache[module.courseId] = {module.id: module};
      }
    } catch (e) {
      logError(e);
    }
  }

  void allByVersionAndId({
    required int version,
    required String courseId,
  }) async {
    try {
      final result = await router.get(endpoint: '/module/$version/$courseId');
      for (final json in result) {
        final module = Module.fromJson(json);
        moduleCache[module.courseId] = {module.id: module};
      }
    } catch (e) {
      logError(e);
    }
  }
}
