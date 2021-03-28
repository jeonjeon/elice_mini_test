import 'package:equatable/equatable.dart';

import 'course_model.dart';

class FilteredCourseListModel extends Equatable {
  final List<CourseModel> courseList;
  final int course_count;

  FilteredCourseListModel(
      {required this.courseList, required this.course_count});

  @override
  // TODO: implement props
  List<Object?> get props => [courseList, course_count];
}
