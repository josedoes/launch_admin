import 'package:code_learn/globals/service.dart';
import 'package:code_learn/launch.dart';
import 'package:code_learn/services/router/router.dart';

VersionService get versionService => locate<VersionService>();

double get version => versionService.publishedVersion;

class VersionService {
  double publishedVersion = 0;

  Future<void> updateVersion(String version) async {
    try {
      final result = await router.post(endpoint: '/version/$version');
      if (result != null) {
        if (result['version'] != null) {
          publishedVersion = result['version'];
        }
      }
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> fetchLatestVersion() async {
    try {
      final result = await router.get(endpoint: '/version');
      if (result != null) {
        if (result['version'] != null) {
          publishedVersion = result['version'];
        }
      }
    } catch (e) {
      logger.e(e);
    }
  }

}
