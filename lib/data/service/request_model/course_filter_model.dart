import 'package:elice_mini_test/core/constants/constant.dart';

class CourseFilterModel {
  final int count = Constant.courseListCount;
  late bool filter_is_free;
  late bool filter_is_recommended;
  late int offset;

  CourseFilterModel({
    required this.filter_is_free,
    required this.filter_is_recommended,
    required this.offset,
  });

  Map<String, dynamic> toMap() {
    return {
      'filter_is_free': this.filter_is_free,
      'filter_is_recommended': this.filter_is_recommended,
      'offset': this.offset,
    };
  }
}
