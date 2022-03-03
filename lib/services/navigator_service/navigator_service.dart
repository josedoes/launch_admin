import 'package:beamer/beamer.dart';
import 'package:code_learn/launch.dart';
import 'package:code_learn/model/course.dart';
import 'package:code_learn/services/auth_service.dart';
import 'package:code_learn/services/navigator_service/locations/building_locations.dart';
import 'package:code_learn/services/navigator_service/locations/paths.dart';
import 'package:flutter/material.dart';

export './locations/paths.dart';

NavigatorService get navigator => locate<NavigatorService>();

class NavigatorService {
  final menuBucket = PageStorageBucket();

  String get initialPath => authService.isAdminSync ? homePath : authPath;

  NavigatorService() {
    routerDelegate = BeamerDelegate(
      initialPath: initialPath,
      updateFromParent: true,
      beamBackTransitionDelegate: const ReverseTransitionDelegate(),
      setBrowserTabTitle: false,
      removeDuplicateHistory: false,
      guards: [
        // BeamGuard(
        //   // on which path patterns (from incoming routes) to perform the check
        //   pathPatterns: ['/$authPath'],
        //   // perform the check on all patterns that **don't** have a match in pathPatterns
        //   guardNonMatching: true,
        //   // return false to redirect
        //   check: (context, location) {
        //     final checkReturn = authService.isAdminSync;
        //     lowLevelLog(
        //       'guarding against ${location.pathPatterns}'
        //       '\ngonna return $checkReturn'
        //       '',
        //     );
        //     return checkReturn;
        //   },
        //   // where to redirect on a false check
        //   beamToNamed: (origin, target) {
        //     lowLevelLog(
        //       'Guarded against origin:${origin?.pathPatterns}\nto target ${target.pathPatterns}',
        //     );
        //
        //     lowLevelLog('navigating to $authPath');
        //     return authPath;
        //   },
        // )
      ],
      locationBuilder: BeamerLocationBuilder(
        beamLocations: [
          HomeLocation(),
          AuthLocation(),
          EditCourseLocation(),
          EditModuleLocation(),
          EditLessonLocation(),
        ],
      ),
    );
  }

  final informationParser = BeamerParser();

  void pop() => routerDelegate.beamBack();

  late final BeamerDelegate routerDelegate;

  void goToHomeAfterLogin() {
    lowLevelLog('Navigating home');
    routerDelegate.beamToReplacementNamed(homePath);
  }

  void goToEditCourseLocation(Course course) {
    lowLevelLog('Navigating to Course');
    routerDelegate.beamToNamed('$editCoursePath/${course.id}', data: course);
  }

  void goToEditModule(String id) {
    lowLevelLog('Navigating to Module');
    routerDelegate.beamToNamed('$editModulePath/$id');
  }

  void goToEditLesson(String id) {
    lowLevelLog('Navigating to Lesson');
    routerDelegate.beamToNamed('$editLessonPath/$id');
  }
}
