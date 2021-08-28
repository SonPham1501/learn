import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:learn/config/constant.dart';
import 'package:learn/models/common/token.dart';
import 'package:learn/utils/secure_storage_service.dart';
import 'package:learn/utils/snackbar_builder.dart';
import 'package:learn/utils/util.dart';

class BuildInterceptorsWrapper extends InterceptorsWrapper {
  BuildInterceptorsWrapper(this.dio);

  final Dio dio;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);
    print('onRequest');
    dio.interceptors.requestLock.lock();
    TokenObj? tokenObj = await SecureStorageService.getTokenObj();
    if (tokenObj != null && tokenObj.accessToken != null && tokenObj.accessToken != '' && options.uri.toString().indexOf('login') == -1) {
      options.headers['access-token'] = tokenObj.accessToken;
      print(options.headers['access-token']);
    }
    dio.interceptors.requestLock.unlock();
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    print('onResponse');
    response.data = response.data is String ? json.decode(response.data) : response.data;
  }

  @override
  void onError(DioError error, ErrorInterceptorHandler handler) {
    print('onError');
    super.onError(error, handler);
    try {
      switch (error.type) {
        case DioErrorType.cancel:
          print('Request Cancelled');
          break;
        case DioErrorType.connectTimeout:
          print('DioErrorType.CONNECT_TIMEOUT');
          break;
        case DioErrorType.other:
          print('DioErrorType.DEFAULT');
          break;
        case DioErrorType.receiveTimeout:
          print('DioErrorType.RECEIVE_TIMEOUT');
          break;
        case DioErrorType.response:
          print('Request with response error ${error.response}');
          if ((error.response?.statusCode == 401 || error.response?.statusCode == 403 || error.response?.statusCode == 404) &&
              !Constant.isForceLogin) {
            Constant.isForceLogin = true;
            UtilService.toDoWhenLogout();
            SnackBarBuilder.showSnackBar(content: 'You need to login to continue');
          }
          break;
        case DioErrorType.sendTimeout:
          print('DioError.sendTimeout');
          break;
      }
    } catch (_) {}
  }
}
