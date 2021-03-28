part of 'main_course_list_cubit.dart';

@immutable
abstract class MainCourseListState extends Equatable {
  @override
  List<Object> get props => [];
}

class MainCourseListInitial extends MainCourseListState {}

class MainCourseListError extends MainCourseListState {}

class MainCourseListSuccess extends MainCourseListState {
  final MainCourseListModel mainCourseListModel;

  MainCourseListSuccess({required this.mainCourseListModel});
}
