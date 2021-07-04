
import 'dart:convert';

List<ResultUsers> resultUsersFromJson(String str) => List.from(json.decode(str).map((e) => ResultUsers.fromJson(e)));

String resultUsersToJson(List<ResultUsers> data) => json.encode(data.map((e) => e.toJson()));


class ResultUsers {
  String? name;
  String? city;

  ResultUsers({this.name, this.city});

  ResultUsers.fromJson(Map<String, dynamic> json) {
    this.name = json["name"];
    this.city = json["city"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = this.name;
    data["city"] = this.city;
    return data;
  }
}