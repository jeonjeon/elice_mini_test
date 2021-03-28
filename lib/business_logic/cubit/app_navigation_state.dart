part of 'app_navigation_cubit.dart';

@immutable
abstract class AppNavigationState {}

class AppNavigationMainState extends AppNavigationState {}

class AppNavigationCourseListState extends AppNavigationState {
  final int count = Constant.courseListCount;
  final bool filterIsFree;
  final bool filterIsRecommended;
  final int offset;

  AppNavigationCourseListState({
    required this.filterIsFree,
    required this.filterIsRecommended,
    required this.offset,
  });

  Map<String, dynamic> toMap() {
    return {
      'filter_is_free': this.filterIsFree,
      'filter_is_recommended': this.filterIsRecommended,
      'offset': this.offset,
    };
  }
}
