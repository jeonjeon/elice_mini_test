import 'dart:convert';
import 'package:elice_mini_test/data/model/course_model.dart';
import 'package:elice_mini_test/data/model/filter_condition_model.dart';
import 'package:elice_mini_test/data/model/filterd_course_list_model.dart';
import 'package:elice_mini_test/data/service/course_api.dart';

class CourseListRepository {
  final CourseApi courseApi = CourseApi();

  Future<FilteredCourseListModel> getCourseList(
      FilterConditionModel condition) async {
    Map<String, dynamic> response =
        jsonDecode(await courseApi.getCourseListWithFilter(condition.toMap()));
    List<CourseModel> courseList = (response['courses'] as List)
        .map((course) => CourseModel.fromMap(course))
        .toList();
    int course_count = response['course_count'];
    return FilteredCourseListModel(
        courseList: courseList, course_count: course_count);
  }
}
