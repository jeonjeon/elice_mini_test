import 'package:elice_mini_test/core/exception/api_request_exception.dart';
import 'package:http/http.dart' as http;

// 각 filter condition별 리스트를 가져오기 위한 api
class CourseApi {
  static const _baseUrl = 'api-rest.elice.io';
  final http.Client _httpClient;
  CourseApi({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  // 각 조건에 맞는 list fetch
  Future<String> getCourseListWithFilter(Map<String, String> params) async {
    var uri = Uri.https(_baseUrl, '/org/academy/course/list/', params);
    final response = await _httpClient.get(uri);
    if (response.statusCode != 200) {
      throw ApiRequestException();
    }
    return response.body;
  }
}
