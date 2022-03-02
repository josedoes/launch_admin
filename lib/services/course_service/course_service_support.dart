import 'package:code_learn/model/course.dart';

extension xCache on Map<double, Map<String, Course>> {
  List<Course> all() {
    final courses = <Course>[];
    for (final coursesMap in values) {
      courses.addAll(coursesMap.values);
    }
    return courses;
  }
}

extension xCoursesById on Map<String, Course> {
  List<Course> all() {
    return values.toList();
  }
}
