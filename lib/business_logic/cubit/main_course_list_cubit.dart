import 'package:bloc/bloc.dart';
import 'package:elice_mini_test/core/constants/course_type.dart';
import 'package:elice_mini_test/data/model/course_model.dart';
import 'package:elice_mini_test/data/model/filter_condition_model.dart';
import 'package:elice_mini_test/data/model/filterd_course_list_model.dart';
import 'package:elice_mini_test/data/model/main_course_list_model.dart';
import 'package:elice_mini_test/data/repository/course_list_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
part 'main_course_list_state.dart';

class MainCourseListCubit extends Cubit<MainCourseListState> {
  MainCourseListCubit({required this.courseListRepository})
      : super(MainCourseListInitial());

  final CourseListRepository courseListRepository;
  void getMainCourseList() async {
    FilteredCourseListModel recommendedCourseList =
        await courseListRepository.getCourseList(FilterConditionModel(
            filterIsFree: false, filterIsRecommended: true, offset: 0));
    FilteredCourseListModel freeCourseList =
        await courseListRepository.getCourseList(FilterConditionModel(
            filterIsFree: true, filterIsRecommended: false, offset: 0));

    emit(MainCourseListSuccess(
        mainCourseListModel: MainCourseListModel(
            recommendedCourseList: recommendedCourseList.courseList,
            freeCourseList: freeCourseList.courseList)));
  }
}
