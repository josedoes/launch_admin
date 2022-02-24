import 'package:code_learn/model/module.dart';
import 'package:stacked/stacked.dart';

import '../services/discover_service/discover_service.dart';

class DiscoverModel extends BaseViewModel {
  final moduleList = <Module>[];

  init() async {
    runBusyFuture(
      Future(
        () async {
          final modules = await discoverService.loadModules();
          moduleList.clear();
          moduleList.addAll(modules);
        },
      ),
    );
  }
}
