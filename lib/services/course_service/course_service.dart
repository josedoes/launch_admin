import 'dart:convert';

import 'package:code_learn/launch.dart';
import 'package:code_learn/model/course.dart';
import 'package:code_learn/services/router/router.dart';

import 'course_service_support.dart';

CourseService get courseService => locate<CourseService>();

class CourseService {
  final base = '/course';
  final coursesCache = <double, Map<String, Course>>{};

  List<Course> fromListJsonToListOfCourse(dynamic response) {
    final courses = <Course>[];
    if (response != null) {
      for (final course in response) {
        courses.add(Course.fromJson(course));
      }
    }
    return courses;
  }

  Future<void> getAllCourses() async {
    try {
      final allCourses = await router.get(endpoint: '$base/');
      final courses = fromListJsonToListOfCourse(allCourses);
      coursesCache.clear();
      addCoursesToCache(courses);
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> fetchCoursesBasedOnVersion({required double version}) async {
    try {
      logInfo('getting courses on version $version');
      final response = await router.get(endpoint: '$base/all/$version');
      final courses = fromListJsonToListOfCourse(response);
      addCoursesToCache(courses);
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> create({required double version}) async {
    try {
      final result = await router.post(endpoint: '$base/$version');
      if (result != null) {
        final course = Course.fromJson(result);
        addCourseToCache(course);
      }
    } catch (e) {
      logger.e(e);
    }
  }

  Future<Course?> getCourseById(String id) async {
    try {
      final course = await router.get(endpoint: '$base/$id');
      return Course.fromJson(course);
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  Future<void> updateACourse(Course course) async {
    try {
      final result = await router.patch(
        endpoint: '$base/${course.id}',
        body: jsonEncode(course.toJson()),
      );
      if (result != null) {
        final course = Course.fromJson(result);
        updateACourseCache(course);
      }
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> deleteACourse(Course course) async {
    try {
      await router.delete(endpoint: '$base/${course.id}');
      deleteCourseCache(course);
    } catch (e) {
      logger.e(e);
    }
  }

  List<Course> getCourses({required double version, required bool allCourses}) {
    if (allCourses) {
      return coursesCache.all();
    } else {
      final coursesByVersion = coursesCache[version];
      if (coursesByVersion != null) {
        return coursesByVersion.all();
      }
    }
    return [];
  }

  void addCourseToCache(Course course) {
    final courses = coursesCache[course.version];
    if (courses != null) {
      coursesCache[course.version]?.addAll({course.id: course});
    } else {
      coursesCache[course.version] = {course.id: course};
    }
  }

  void addCoursesToCache(List<Course> courses) {
    for (final course in courses) {
      if (coursesCache[course.version] == null) {
        coursesCache[course.version] = {course.id: course};
      }
      coursesCache[course.version]?[course.id] = course;
    }
  }

  void deleteCourseCache(Course course) {
    coursesCache[course.version]?.remove(course.id);
  }

  void updateACourseCache(Course course) {
    coursesCache[course.version]?[course.id] = course;
  }
}
