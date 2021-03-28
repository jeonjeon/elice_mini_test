part of 'course_list_bloc.dart';

@immutable
abstract class CourseListEvent {
  final CourseType courseType;
  CourseListEvent(this.courseType);
}

class CourseListFetch extends CourseListEvent {
  CourseListFetch({required courseType}) : super(courseType);
}
