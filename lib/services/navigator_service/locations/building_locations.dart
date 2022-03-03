import 'package:beamer/beamer.dart';
import 'package:code_learn/view/auth_view/auth_view.dart';
import 'package:code_learn/view/edit_course_view/edit_course_view.dart';
import 'package:code_learn/view/edit_module_view/edit_module_view.dart';
import 'package:code_learn/view/home_view/home_view.dart';
import 'package:flutter/material.dart';

import '../../../view/edit_lesson_view/edit_lesson_view.dart';
import 'paths.dart';

class AuthLocation extends BeamLocation {
  @override
  List<BeamPage> buildPages(
      BuildContext context, RouteInformationSerializable<dynamic> state) {
    return [
      const BeamPage(
        title: 'Auth',
        name: 'Auth',
        key: ValueKey('Auth View'),
        child: AuthView(),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => [authPath];
}

class HomeLocation extends BeamLocation {
  @override
  List<BeamPage> buildPages(
      BuildContext context, RouteInformationSerializable<dynamic> state) {
    return const [
      BeamPage(
        title: 'Home',
        name: 'home',
        key: ValueKey('Home View'),
        child: HomeView(),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => [homePath];
}

class EditCourseLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, _state) {
    final courseId = _state.pathParameters['courseId'];

    return [
      BeamPage(
        title: 'Edit Course',
        name: 'Edit Course',
        key: const ValueKey('EditCourseView'),
        child: EditCourseView(courseId: courseId ?? ''),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['$editCoursePath/:courseId'];
}

class EditModuleLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, _state) {
    final id = _state.pathParameters['id'];

    return [
      BeamPage(
        title: 'Edit Module',
        name: 'Edit Module',
        key: const ValueKey('Edit Module'),
        child: EditModuleView(id: id ?? ''),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['$editModulePath/:id'];
}

class EditLessonLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, _state) {
    final id = _state.pathParameters['id'];

    return [
      BeamPage(
        title: 'Edit Lesson',
        name: 'Edit Lesson',
        key: const ValueKey('Edit Lesson'),
        child: EditLessonView(id: id ?? ''),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['$editLessonPath/:id'];
}
