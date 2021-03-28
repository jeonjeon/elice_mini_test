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
      : super(CourseListInitialState());

  @override
  Stream<CourseListState> mapEventToState(CourseListEvent event) async* {
    try {
      if (event is CourseListInitialEvent) {
        yield CourseListInitialState();
        final FilteredCourseListModel courseListModel =
            await courseListRepository.getCourseList(FilterConditionModel(
                filterIsFree: event.courseType == CourseType.FREE_COURSE,
                filterIsRecommended:
                    event.courseType == CourseType.RECOMMENDED_COURSE,
                offset: 0));
        yield CourseListSuccessState(
            courseType: event.courseType,
            courseList: courseListModel.courseList,
            course_count: courseListModel.course_count);
        return;
      }
      if (event is CourseListLoadMoreEvent && !isMaxCount(state)) {
        final FilteredCourseListModel courseListModel =
            await courseListRepository.getCourseList(FilterConditionModel(
                filterIsFree: event.courseType == CourseType.FREE_COURSE,
                filterIsRecommended:
                    event.courseType == CourseType.RECOMMENDED_COURSE,
                offset: (state as CourseListSuccessState).courseList.length));
        yield courseListModel.courseList.isEmpty
            ? (state as CourseListSuccessState).copyWith(
                course_count: (state as CourseListSuccessState).course_count)
            : CourseListSuccessState(
                courseType: event.courseType,
                courseList: (state as CourseListSuccessState).courseList +
                    courseListModel.courseList,
                course_count: (state as CourseListSuccessState).course_count,
              );
        return;
      }
    } catch (_) {
      yield CourseListErrorState();
    }
    return;
  }

  bool isMaxCount(CourseListState state) =>
      state is CourseListSuccessState &&
      state.course_count == state.courseList.length;
}
