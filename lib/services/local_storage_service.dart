import 'package:code_learn/globals/service.dart';
import 'package:hive_flutter/hive_flutter.dart';

LocalStorageService get localStorage => locate<LocalStorageService>();

class LocalStorageService {
  LocalStorageService() {
    Hive.initFlutter();
  }

  Future<void> init() async {
    await Hive.openBox('auth');
  }

  Box? getBox(String title) => Hive.box(title);

  Box? getAuthBox() => getBox('auth');
}
