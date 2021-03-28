part of 'app_navigation_cubit.dart';

@immutable
abstract class AppNavigationState extends Equatable {}

class AppNavigationMainState extends AppNavigationState {
  @override
  List<Object?> get props => [];
}

class AppNavigationCourseListState extends AppNavigationState {
  final CourseType courseType;
  AppNavigationCourseListState({required this.courseType});

  @override
  List<Object?> get props => [courseType];
}
