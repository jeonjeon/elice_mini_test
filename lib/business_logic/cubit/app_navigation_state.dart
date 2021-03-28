part of 'app_navigation_cubit.dart';

@immutable
abstract class AppNavigationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AppNavigationMainState extends AppNavigationState {}

class AppNavigationCourseListState extends AppNavigationState {
  final CourseType courseType;
  AppNavigationCourseListState({required this.courseType});

  @override
  List<Object?> get props => [courseType];
}

class AppNavigationWebViewState extends AppNavigationState {
  final String url;
  AppNavigationWebViewState({required this.url});

  @override
  List<Object> get props => [url];
}
