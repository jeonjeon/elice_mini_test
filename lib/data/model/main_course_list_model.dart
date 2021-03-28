import 'package:elice_mini_test/data/model/course_model.dart';
import 'package:equatable/equatable.dart';

class MainCourseListModel extends Equatable {
  final List<CourseModel> recommendedCourseList;
  final List<CourseModel> freeCourseList;

  MainCourseListModel(
      {required this.recommendedCourseList, required this.freeCourseList});

  @override
  List<Object?> get props => [recommendedCourseList, freeCourseList];
}
