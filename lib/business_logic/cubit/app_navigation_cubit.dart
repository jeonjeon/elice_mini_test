import 'package:bloc/bloc.dart';
import 'package:elice_mini_test/core/constants/constant.dart';
import 'package:elice_mini_test/core/constants/course_type.dart';
import 'package:meta/meta.dart';
part 'app_navigation_state.dart';

class AppNavigationCubit extends Cubit<AppNavigationState> {
  AppNavigationCubit() : super(AppNavigationMainState());

  void goToCourseListScreen(CourseType courseType) {
    if (courseType == CourseType.FREE_COURSE) {
      emit(AppNavigationCourseListState(
          filterIsFree: true, filterIsRecommended: false, offset: 0));
      return;
    }
    if (courseType == CourseType.RECOMMENDED_COURSE) {
      emit(AppNavigationCourseListState(
          filterIsFree: false, filterIsRecommended: true, offset: 0));
      return;
    }
  }

  void backToMainScreen() => emit(AppNavigationMainState());
}
