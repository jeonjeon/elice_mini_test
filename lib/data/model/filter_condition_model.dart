import 'package:elice_mini_test/core/constants/constant.dart';

class FilterConditionModel {
  final int count = Constant.defaultListCount;
  final bool filterIsFree;
  final bool filterIsRecommended;
  final int offset;

  FilterConditionModel({
    required this.filterIsFree,
    required this.filterIsRecommended,
    required this.offset,
  });

  Map<String, String> toMap() {
    return {
      'count': this.count.toString(),
      'filter_is_free': this.filterIsFree.toString(),
      'filter_is_recommended': this.filterIsRecommended.toString(),
      'offset': this.offset.toString(),
    };
  }

  @override
  String toString() {
    return 'FilterConditionModel{count: $count, filterIsFree: $filterIsFree, filterIsRecommended: $filterIsRecommended, offset: $offset}';
  }
}
