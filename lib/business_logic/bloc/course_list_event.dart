part of 'course_list_bloc.dart';

@immutable
abstract class CourseListEvent {
  final CourseType courseType;
  CourseListEvent(this.courseType);
}

class CourseListInitialEvent extends CourseListEvent {
  CourseListInitialEvent({required courseType}) : super(courseType);
}

class CourseListLoadMoreEvent extends CourseListEvent {
  CourseListLoadMoreEvent({required courseType}) : super(courseType);
}
