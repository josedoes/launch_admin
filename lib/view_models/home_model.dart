import 'package:code_learn/model/course.dart';
import 'package:code_learn/services/course_service/course_service.dart';
import 'package:code_learn/services/version_service.dart';
import 'package:code_learn/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';

import '../services/navigator_service/navigator_service.dart';

class HomeModel extends BaseViewModel {
  HomeModel() {
    versionController = TextEditingController()
      ..addListener(() {
        notifyListeners();
      });

  }

  double currentVersion = 0;

  late final TextEditingController versionController;

  bool get isShowingAllCourses => currentVersion == 0;

  bool get isUpToDate => currentVersion == versionController.version;

  List<Course> get courses => courseService.getCourses(
        version: currentVersion,
        allCourses: isShowingAllCourses,
      );

  double get publishedVersion => versionService.publishedVersion;

  bool get isPublished => publishedVersion == versionController.text.toDouble();

  void init() {
    runBusyFuture(Future(() async {
      await versionService.fetchLatestVersion();
      await courseService.getAllCourses();
      currentVersion = versionService.publishedVersion;
      versionController.text = versionService.publishedVersion.toString();
    }));
  }

  void changeVersion() {
    final newVersion = versionController.version;
    currentVersion = newVersion;
    notifyListeners();
  }

  void loadCoursesOnVersion() {
    runBusyFuture(Future(() {
      changeVersion();
      courseService.fetchCoursesBasedOnVersion(version: currentVersion);
    }));
  }

  void addCourse() async {
    runBusyFuture(Future(() async {
      await courseService.create(version: currentVersion);
    }), busyObject: editCourseBusyObject);
  }

  void delete(Course course) async {
    await courseService.deleteACourse(course);
    notifyListeners();
  }

  void editCourse(Course course) => navigator.goToEditCourseLocation(course);

  void onPublishVersion() async {
    final newVersion = versionController.text;
    Logger().d('onPublishVersion called with version $newVersion');
    await versionService.updateVersion(newVersion);
    notifyListeners();
  }
}

const editCourseBusyObject = 0;

extension _controller on TextEditingController {
  double get version => double.tryParse(text.isEmpty ? '0' : text) ?? 0;
}
