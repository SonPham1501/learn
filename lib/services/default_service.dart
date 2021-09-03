import 'package:learn/models/city/city.dart';
import 'package:learn/plugin/dio.dart';
import 'package:learn/response/request_response.dart';
import 'package:learn/response/response_data.dart';

class DefaultService {
  static DefaultService? _instance;

  factory DefaultService() => _instance ??= DefaultService._();

  DefaultService._();

  // 'https://jsonplaceholder.typicode.com/posts'
  Future<List<City>> getCities() async {
    final RequestResponse response = await http.fetch('https://freelancer.timviec365.com/api_app/get_city.php', null, POST_METHOD);
    if (response.result) {
      print(response.data);
      ResponseData resData = response.data;
    } else
      print(response.error);

    return [];
  }
}
