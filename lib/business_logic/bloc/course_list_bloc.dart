import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:elice_mini_test/core/constants/course_type.dart';
import 'package:elice_mini_test/data/model/course_model.dart';
import 'package:elice_mini_test/data/model/filter_condition_model.dart';
import 'package:elice_mini_test/data/model/filterd_course_list_model.dart';
import 'package:elice_mini_test/data/repository/course_list_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
part 'course_list_event.dart';
part 'course_list_state.dart';

class CourseListBloc extends Bloc<CourseListEvent, CourseListState> {
  final CourseListRepository courseListRepository;

  CourseListBloc({required this.courseListRepository})
      : super(CourseListInitial());

  @override
  Stream<CourseListState> mapEventToState(CourseListEvent event) async* {
    if (event is CourseListFetch && !isMaxCount(state)) {
      try {
        if (state is CourseListInitial) {
          final FilteredCourseListModel courseListModel =
              await courseListRepository.getCourseList(FilterConditionModel(
                  filterIsFree: event.courseType == CourseType.FREE_COURSE,
                  filterIsRecommended:
                      event.courseType == CourseType.RECOMMENDED_COURSE,
                  offset: 0));
          yield CourseListSuccess(
              courseList: courseListModel.courseList,
              course_count: courseListModel.course_count);
          return;
        }
        if (state is CourseListSuccess) {
          final FilteredCourseListModel courseListModel =
              await courseListRepository.getCourseList(FilterConditionModel(
                  filterIsFree: event.courseType == CourseType.FREE_COURSE,
                  filterIsRecommended:
                      event.courseType == CourseType.RECOMMENDED_COURSE,
                  offset: (state as CourseListSuccess).courseList.length));
          yield courseListModel.courseList.isEmpty
              ? (state as CourseListSuccess).copyWith(
                  course_count: (state as CourseListSuccess).course_count)
              : CourseListSuccess(
                  courseList: (state as CourseListSuccess).courseList +
                      courseListModel.courseList,
                  course_count: (state as CourseListSuccess).course_count,
                );
          return;
        }
      } catch (_) {
        print('error ======= ${_.toString()}');
        yield CourseListError();
      }
    }
  }

  bool isMaxCount(CourseListState state) =>
      state is CourseListSuccess &&
      state.course_count == state.courseList.length;
}
