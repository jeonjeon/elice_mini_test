import 'package:bloc/bloc.dart';
import 'package:elice_mini_test/core/constants/course_type.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
part 'app_navigation_state.dart';

class AppNavigationCubit extends Cubit<AppNavigationState> {
  AppNavigationCubit() : super(AppNavigationMainState());

  void goToCourseListScreen(CourseType courseType) =>
      emit(AppNavigationCourseListState(courseType: courseType));

  void backToMainScreen() => emit(AppNavigationMainState());
}
