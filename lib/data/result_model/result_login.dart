

import 'dart:convert';

ResultLogin resultLoginFromJson(String str) => ResultLogin.fromJson(json.decode(str));

String resultLoginToJson(ResultLogin data) => json.encode(data.toJson());

class ResultLogin {
  Data? data;
  Error? error;

  ResultLogin({this.data, this.error});

  ResultLogin.fromJson(Map<String, dynamic> json) {
    this.data = json["data"] == null ? null : Data.fromJson(json["data"]);
    this.error = json["error"] == null? null : Error.fromJson(json['error']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.data != null)
      data["data"] = this.data?.toJson();
    data["error"] = this.error?.toJson();
    return data;
  }
}

class Data {
  bool? result;
  String? message;
  String? accessToken;
  UserInfo? userInfo;

  Data({this.result, this.message, this.accessToken, this.userInfo});

  Data.fromJson(Map<String, dynamic> json) {
    this.result = json["result"];
    this.message = json["message"];
    this.accessToken = json["access_token"];
    this.userInfo = json["user_info"] == null ? null : UserInfo.fromJson(json["user_info"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["result"] = this.result;
    data["message"] = this.message;
    data["access_token"] = this.accessToken;
    if(this.userInfo != null)
      data["user_info"] = this.userInfo?.toJson();
    return data;
  }
}

class UserInfo {
  String? epId;
  String? epEmail;
  String? epPassword;
  String? epName;
  String? epPhone;
  String? epLogo;
  String? epPathLogo;
  String? gt;
  String? epBirthday;
  String? createTime;
  String? updateTime;
  dynamic? epLat;
  dynamic? epLong;

  UserInfo({this.epId, this.epEmail, this.epPassword, this.epName, this.epPhone, this.epLogo, this.epPathLogo, this.gt, this.epBirthday, this.createTime, this.updateTime, this.epLat, this.epLong});

  UserInfo.fromJson(Map<String, dynamic> json) {
    this.epId = json["ep_id"];
    this.epEmail = json["ep_email"];
    this.epPassword = json["ep_password"];
    this.epName = json["ep_name"];
    this.epPhone = json["ep_phone"];
    this.epLogo = json["ep_logo"];
    this.epPathLogo = json["ep_path_logo"];
    this.gt = json["gt"];
    this.epBirthday = json["ep_birthday"];
    this.createTime = json["create_time"];
    this.updateTime = json["update_time"];
    this.epLat = json["ep_lat"];
    this.epLong = json["ep_long"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["ep_id"] = this.epId;
    data["ep_email"] = this.epEmail;
    data["ep_password"] = this.epPassword;
    data["ep_name"] = this.epName;
    data["ep_phone"] = this.epPhone;
    data["ep_logo"] = this.epLogo;
    data["ep_path_logo"] = this.epPathLogo;
    data["gt"] = this.gt;
    data["ep_birthday"] = this.epBirthday;
    data["create_time"] = this.createTime;
    data["update_time"] = this.updateTime;
    data["ep_lat"] = this.epLat;
    data["ep_long"] = this.epLong;
    return data;
  }
}

class Error {
  int? code;
  String? message;

  Error({this.code, this.message});

  Error.fromJson(Map<String, dynamic> json) {
    this.code = json["code"];
    this.message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["code"] = this.code;
    data["message"] = this.message;
    return data;
  }
}