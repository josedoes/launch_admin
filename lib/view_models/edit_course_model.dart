import 'package:code_learn/model/course.dart';
import 'package:code_learn/model/module.dart';
import 'package:code_learn/services/course_service/course_service.dart';
import 'package:code_learn/services/module_service/module_service.dart';
import 'package:code_learn/services/navigator_service/navigator_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class EditCourseModel extends BaseViewModel {
  EditCourseModel({required this.courseId}) {
    courseName = TextEditingController();
    courseDescription = TextEditingController();
    courseImageUrl = TextEditingController();
    shortDescription = TextEditingController();
    midDescription = TextEditingController();
    longDescription = TextEditingController();
  }

  final String courseId;
  Course? course;

  late final TextEditingController courseName;
  late final TextEditingController courseDescription;
  late final TextEditingController courseImageUrl;
  late final TextEditingController shortDescription;
  late final TextEditingController midDescription;
  late final TextEditingController longDescription;

  List<Module> get modules =>
      moduleService.getModulesCacheModules(courseId: courseId);

  void init() async {
    runBusyFuture(Future(() async {
      final _course = await courseService.getCourseById(courseId);

      if (_course != null) {
        await moduleService.fetchAllByVersionAndId(
          version: _course.version,
          courseId: courseId,
        );
        course = _course;
        courseName.text = _course.name;
        courseImageUrl.text = _course.image;
        shortDescription.text = _course.shortDescription;
        midDescription.text = _course.midDescription;
        longDescription.text = _course.longDescription;
      }
    }));
  }

  void updateCourse() {
    final course = this.course;
    if (course == null) return;
    courseService.updateACourse(course.copyWith(
      image: courseImageUrl.text,
      name: courseName.text,
      version: course.version,
      shortDescription: shortDescription.text,
      midDescription: midDescription.text,
      longDescription: longDescription.text,
    ));
  }

  void switchButton(bool value) {
    final course = this.course;
    if (course == null) return;
    this.course = course.copyWith(published: value);
    notifyListeners();
  }

  void addModule() {
    runBusyFuture(Future(() async {
      final course = this.course;
      if (course == null) return;
      await moduleService.create(
        version: course.version,
        courseId: course.id,
      );
    }));
  }

  void editModule(String moduleId) => navigator.goToEditModule(moduleId);
}
