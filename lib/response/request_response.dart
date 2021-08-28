import 'dart:convert';

class RequestResponse {
  RequestResponse(this.data, this.result, this.code, {this.headers, this.error}) {
    if(data.toString().contains('error')){
      setError(data.toString());
    }
  }

  dynamic data;
  bool result;
  int? code;
  dynamic headers;
  Error? error;

  void setError(String strResponse) {
    try {
      var res = json.decode(strResponse);
      error = res['error'] == null ? null : Error.fromJson(res['error']);
    } catch (e) {
      error = Error(code: 404, message: e.toString());
    }
  }
}

class Error {
  Error({
    required this.code,
    required this.message,
  });

  int code;
  String message;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        code: json['code'],
        message: json['message'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
      };

  @override
  String toString() => 'Code: $code, Message: $message';
}
