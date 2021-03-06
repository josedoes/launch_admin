import 'package:code_learn/launch.dart';
import 'package:code_learn/model/course.dart';
import 'package:code_learn/view/widgets/AdminText/text_body.dart';
import 'package:code_learn/view/widgets/base_button.dart';
import 'package:code_learn/view/widgets/base_text_field.dart';
import 'package:code_learn/view/widgets/rocket_switcher.dart';
import 'package:code_learn/view_models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/buttons/add_button.dart';

class CourseManager extends ViewModelWidget<HomeModel> {
  const CourseManager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, model) {
    Widget child = const SizedBox();
    if (model.busy(editCourseBusyObject)) {
      child = Container();
    } else {
      child = SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Version(),
            SizedBox(height: 40),
            AddCourse(),
            SizedBox(height: 12),
            CourseList(),
          ],
        ),
      );
    }
    return RocketSwitcher(
      child: SizedBox(
        child: child,
      ),
    );
  }
}

class Version extends ViewModelWidget<HomeModel> {
  const Version({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, model) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            child: BaseTextField(
              controller: model.versionController,
              label: const TextBody('Search by version (0 to show all)'),
              inputFormatters: doubleFormatter,
            ),
          ),
          const SizedBox(width: 40),
          SizedBox(
            width: 60,
            child: _uploadIcon(model),
          ),
          SizedBox(
            width: 60,
            child: _downloadIcon(model),
          )
        ],
      ),
    );
  }

  Widget _uploadIcon(HomeModel model){
    Widget child = Container();
    if (!model.isPublished) {
      child = IconButton(
        onPressed: model.onPublishVersion,
        icon: const Icon(
          Icons.cloud_upload,
          color: white,
        ),
      );
    }
    return child;
  }

  Widget _downloadIcon(HomeModel model) {
    Widget child = Container();
    if (!model.isUpToDate) {
      child = IconButton(
        onPressed: model.loadCoursesOnVersion,
        icon: const Icon(
          Icons.cloud_download,
          color: white,
        ),
      );
    }
    return child;
  }
}

const courseItemHeight = 300.0;

class CourseList extends ViewModelWidget<HomeModel> {
  const CourseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, model) {
    final courses = model.courses;
    return SizedBox(
      height: courseItemHeight,
      child: ListView.builder(
        itemCount: courses.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, i) {
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CourseDisplay(
              course: courses[i],
            ),
          );
        },
      ),
    );
  }
}

class AddCourse extends ViewModelWidget<HomeModel> {
  const AddCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, model) {
    return AddButton(
      onPressed: model.addCourse,
      title: 'Add Course',
    );
  }
}

class CourseDisplay extends ViewModelWidget<HomeModel> {
  const CourseDisplay({required this.course, Key? key}) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context, model) {
    return Container(
      height: courseItemHeight,
      width: courseItemHeight,
      decoration: const BoxDecoration(color: policeBlue),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextBody(
                'version: ${course.version}',
              ),
              TextBody(
                course.published ? 'published' : 'unpublished',
                color: course.published ? Colors.green : Colors.red,
              ),
            ],
          ),
          const Spacer(),
          Text(
            course.name,
            style: poppins.copyWith(
              color: white,
              fontWeight: semiBold,
              fontSize: 28,
            ),
          ),
          const Spacer(),
          const SizedBox(height: 12),
          BaseButton(
            title: 'Edit',
            onPressed: () => model.editCourse(course),
          ),
          const SizedBox(height: 8),
          BaseButton(
              title: 'Delete',
              onPressed: () => model.delete(course),
              color: Colors.red),
        ],
      ),
    );
  }
}
