import 'package:code_learn/model/module.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../services/module_service/module_service.dart';

class EditModuleModel extends BaseViewModel {
  ///the id must be a courseId
  EditModuleModel({required this.id});

  final versionController = TextEditingController();
  final courseIdController = TextEditingController();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final imageController = TextEditingController();

  String id;

  Module? module;

  Future<void> init() async {
    runBusyFuture(Future(() async {
      await moduleService.read(id: id);
      module = moduleService.loadModuleFromCache(id: id);
      final _module = module;

      if (_module != null) {
        versionController.text = _module.version.toString();
        courseIdController.text = _module.courseId;
        nameController.text = _module.name;
        descriptionController.text = _module.description;
        imageController.text = _module.image;
      }
    }));
  }
}
