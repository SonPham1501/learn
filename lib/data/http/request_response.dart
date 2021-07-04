

import 'dart:convert';

class RequestResponse{
  dynamic data;
  bool result;
  int? code;
  dynamic headers;
  Error? error;

  RequestResponse(this.data, this.result, this.code, {this.headers, this.error}){
    if(this.data.toString().contains('error')){
      setError(this.data.toString());
    }
  }

  void setError(String strResponse){
    try{
      final res = json.decode(strResponse);
      this.error = res['error'] ?? Error.fromJson(res['error']);
    }catch(e){
      this.error = Error(code: 404, message: e.toString());
    }
  }
}

class Error {
  int code;
  String message;

  Error({required this.code, required this.message});

  factory Error.fromJson(Map<String, dynamic> json) => Error(code: json['code'], message: json['message']);

  Map<String, dynamic> toJson() => {'code': code, 'message': message};
}
