import 'package:dio/dio.dart';
import 'package:learn/config/constant.dart';
import 'package:learn/plugin/interceptor.dart';
import 'package:learn/plugin/locator.dart';
import 'package:learn/plugin/navigator.dart';
import 'package:learn/response/request_response.dart';

final NavigationService navigationService = locator<NavigationService>();

final _HttpManager http = _HttpManager();

// ignore: non_constant_identifier_names
final POST_METHOD = Options(method: 'POST');

class _HttpManager {
  final Dio _dio = Dio(BaseOptions(
    connectTimeout: 10000,
    responseType: ResponseType.json,
    contentType: ResponseType.json.toString(),
  ));

  _HttpManager() {
    _dio.interceptors.add(BuildInterceptorsWrapper(_dio));
  }

  Future<RequestResponse> fetch(String url, params, Options? option,
      {Map<String, dynamic>? header, bool noTip = false, bool isFormData = false}) async {
    Map<String, dynamic> headers = {};

    print('url: $url');
    if (header != null) headers.addAll(header);
    if (option == null) option = Options(method: 'GET');

    option.headers = headers;

    Response response;
    try {
      response = await _dio.request(
        url,
        data: isFormData ? FormData.fromMap(params) : params,
        options: option,
      );
    } on DioError catch (e) {
      return _resultError(url, e, noTip);
    }
    if(response.data is DioError) return _resultError(url, response.data, noTip);

    return RequestResponse(response.data, true, response.statusCode);
  }

  _resultError(String url, DioError error, bool noTip) {
    Response errorResponse = error.response ?? Response(statusCode: 666, requestOptions: RequestOptions(path: url));
    if (error.type == DioErrorType.connectTimeout || error.type == DioErrorType.receiveTimeout) {
      errorResponse.statusCode = Constant.NETWORK_TIMEOUT;
    }
    return RequestResponse(
      _errorHandleFunction(errorResponse.statusCode, error.message, noTip),
      false,
      errorResponse.statusCode,
    );
  }

  _errorHandleFunction(code, message, noTip) {
    if (noTip) return message;
    if (message != null && message is String && (message.contains('Connection refused') || message.contains('Connection reset'))) {
      code = Constant.GITHUB_API_REFUSED;
    }
    return message;
  }
}
