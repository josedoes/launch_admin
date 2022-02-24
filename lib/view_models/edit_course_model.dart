import 'package:code_learn/model/course.dart';
import 'package:code_learn/services/course_service/course_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class EditCourseModel extends BaseViewModel {
  EditCourseModel({required this.course}) {
    courseName = TextEditingController(text: course.name);
    courseDescription = TextEditingController(text: 'description');
    courseImageUrl = TextEditingController(text: course.image);
  }

  final Course course;

  late final TextEditingController courseName;
  late final TextEditingController courseDescription;
  late final TextEditingController courseImageUrl;

  void updateCourse() {
    courseService.updateACourse(course.copyWith(
      image: courseImageUrl.text,
      name: courseName.text,
      version: course.version + 0.1,
    ));
  }
}
