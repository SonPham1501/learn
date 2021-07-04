import 'package:dio/dio.dart';
import 'package:learn/data/http/code.dart';
import 'package:learn/data/http/request_response.dart';

// ignore: non_constant_identifier_names
final POST_METHOD = Options(method: 'post');

class HttpManager {
  final Dio _dio = Dio();

  Future<RequestResponse> fetch(String url, params, Options? option,
      {Map<String, dynamic>? header, bool noTip = false, bool isFormData = false}) async {
    Map<String, dynamic> headers = {};
    if (header != null) headers.addAll(header);

    if (option == null) option = Options(method: 'get');

    option.headers = headers;

    Response response;
    try {
      response = await _dio.request(
        url,
        data: isFormData? FormData.fromMap(params) : params,
        options: option,
      );
    } on DioError catch (e) {
      return _resultError(url, e, option, noTip);
    }

    if(response.data is DioError){
      return _resultError(url, response.data, option, noTip);
    }

    return RequestResponse(response.data, true, response.statusCode);
  }

  _resultError(String url, DioError e, Options option, bool noTip) {
    Response errorResponse = e.response ?? Response(statusCode: 666, requestOptions: RequestOptions(path: url));

    if (e.type == DioErrorType.receiveTimeout || e.type == DioErrorType.connectTimeout) {
      errorResponse.statusCode = Code.NETWORK_TIMEOUT;
    }
    return RequestResponse(
      Code.errorHandleFunction(errorResponse.statusCode, e.message, noTip),
      false,
      errorResponse.statusCode,
    );
  }
}

final HttpManager httpManager = HttpManager();
