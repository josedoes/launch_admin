import 'package:code_learn/globals/service.dart';
import 'package:code_learn/launch.dart';
import 'package:code_learn/services/router/router.dart';

VersionService get versionService => locate<VersionService>();

double get version => versionService.lastVersion;

class VersionService {
  double lastVersion = 0;

  Future<void> updateVersion(double version) async {
    try {
      final result = await router.post(endpoint: '/version/$version');
      if (result != null) {
        if (result['version'] != null) {
          lastVersion = result['version'];
        }
      }
    } catch (e) {
      logError(e);
    }
  }

  Future<void> fetchLatestVersion() async {
    try {
      final result = await router.get(endpoint: '/version');
      if (result != null) {
        if (result['version'] != null) {
          lastVersion = result['version'];
        }
      }
    } catch (e) {
      logError(e);
    }
  }
}
