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

  Future<void> create(
      {required double version, required String courseId}) async {
    try {
      final result = await router.post(endpoint: '/module/$version/$courseId');
      final module = Module.fromJson(result);
      addCourseToCache(module);
    } catch (e) {
      logError(e);
    }
  }

  Future<void> read({required String id}) async {
    try {
      final result = await router.get(endpoint: '/module/$id');
      final module = Module.fromJson(result);
      addCourseToCache(module);
    } catch (e) {
      logError(e);
    }
  }

  void addCourseToCache(Module module) {
    final modules = moduleCache[module.courseId];
    if (modules != null) {
      moduleCache[module.courseId]?.addAll({module.id: module});
    } else {
      moduleCache[module.courseId] = {module.id: module};
    }
  }

  Future<void> update({required String id}) async {
    try {
      final result = await router.patch(endpoint: '/module/$id');
      final module = Module.fromJson(result);
      moduleCache[module.courseId]?.addAll({module.id: module});
    } catch (e) {
      logError(e);
    }
  }

  Future<void> delete({required id}) async {
    try {
      final result = await router.delete(endpoint: '/module/$id');
      final module = Module.fromJson(result);
      moduleCache[module.courseId]?.remove(module.id);
    } catch (e) {
      logError(e);
    }
  }

  Future<void> all() async {
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

  Future<void> allByVersionAndId({
    required double version,
    required String courseId,
  }) async {
    try {
      final result = await router.get(endpoint: '/module/$version/$courseId');
      for (final json in result) {
        final module = Module.fromJson(json);
        if (moduleCache[module.courseId] != null) {
          moduleCache[module.courseId]?.addAll({module.id: module});
        } else {
          moduleCache[module.courseId] = {module.id: module};
        }
      }
    } catch (e) {
      logError(e);
    }
  }
}
