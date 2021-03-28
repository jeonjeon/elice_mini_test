part of 'course_list_bloc.dart';

@immutable
abstract class CourseListState extends Equatable {
  @override
  List<Object> get props => [];
}

class CourseListInitial extends CourseListState {}

class CourseListError extends CourseListState {}

class CourseListSuccess extends CourseListState {
  final List<CourseModel> courseList;
  final int course_count;
  final CourseType courseType;

  CourseListSuccess({
    required this.courseType,
    required this.courseList,
    required this.course_count,
  });

  CourseListSuccess copyWith({
    List<CourseModel>? courseList,
    int? course_count,
    CourseType? courseType,
  }) {
    return CourseListSuccess(
      courseList: courseList ?? this.courseList,
      course_count: course_count ?? this.course_count,
      courseType: courseType ?? this.courseType,
    );
  }

  @override
  List<Object> get props => [courseList, course_count];
}
