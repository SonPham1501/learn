import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:learn/config/constant.dart';
import 'package:learn/models/common/token.dart';
import 'package:learn/plugin/locator.dart';
import 'package:learn/plugin/navigator.dart';
import 'package:learn/response/response_data.dart';
import 'package:learn/utils/secure_storage_service.dart';
import 'package:learn/utils/snackbar_builder.dart';
import 'package:learn/utils/util.dart';

final NavigationService navigationService = locator<NavigationService>();

Dio http = Dio(BaseOptions(
  connectTimeout: 10000,
  responseType: ResponseType.json,
  contentType: ResponseType.json.toString(),
))
  ..interceptors.addAll([_buildInterceptorsWrapper()]);

_buildInterceptorsWrapper() => InterceptorsWrapper(
      onRequest: (options, handler) async {
        http.interceptors.requestLock.lock();
        TokenObj? tokenObj = await SecureStorageService.getTokenObj();
        if (tokenObj != null && tokenObj.accessToken != null && tokenObj.accessToken!.isNotEmpty && options.uri.toString().indexOf('login') == -1) {
          options.headers['access-token'] = tokenObj.accessToken;
          http.interceptors.requestLock.unlock();
          return handler.next(options);
        }
        http.interceptors.requestLock.unlock();
        return handler.next(options);
      },
      onResponse: (response, handler) {
        //Do something with response data
        if (response.data['status'] != null) {
          response.data['status'] = response.data['status'] == Constant.successText;
        }
        if (response.requestOptions.path.indexOf('login') != -1) {
          response.data['data'] = response.data['tokenObject'];
        }
        try {
          if (response.data['data']['totalPages'] != null) {
            if (response.data['pagination'] == null) response.data['pagination'] = {};
            response.data['pagination']['page'] = response.data['data']['number'] + 1;
            response.data['pagination']['size'] = response.data['data']['size'];
            response.data['pagination']['total'] = response.data['data']['totalPages'];
            response.data['pagination']['totalRecords'] = response.data['data']['totalElements'];
          }
        } catch (_) {
          response.data['pagination'] = {};
        }
        ResponseData responseData = ResponseData.fromJson(response.data);
        response.data = responseData;
        return handler.next(response); //Tiếp tục
      },
      onError: (error, handler) {
        try{
          switch(error.type){
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
              if((error.response?.statusCode == 401 || error.response?.statusCode == 403) && !Constant.isForceLogin){
                Constant.isForceLogin = true;
                UtilService.toDoWhenLogout();
                SnackBarBuilder.showSnackBar(content: 'You need to login to continue');
              }
              break;
            case DioErrorType.sendTimeout:
              print('SendTimeout');
              break;
          }
        }catch(_){
          return handler.next(error);
        }
        Map<String, dynamic> json = jsonDecode(error.response.toString()) ?? {};
        error.response?.data = ResponseData(false, json['message'] ?? 'Error', null, null);
        return handler.next(error);
      },
    );
