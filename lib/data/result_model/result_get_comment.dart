
import 'dart:convert';

List<ResultGetComment> resultGetCommentFromJson(String str) => List<ResultGetComment>.from(json.decode(str).map((e) => ResultGetComment.fromJson(e)));

String resultGetCommentToJson(List<ResultGetComment> data) => json.encode(List.from(data.map((e) => e.toJson())));

class ResultGetComment {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  ResultGetComment({this.postId, this.id, this.name, this.email, this.body});

  ResultGetComment.fromJson(Map<String, dynamic> json) {
    this.postId = json["postId"];
    this.id = json["id"];
    this.name = json["name"];
    this.email = json["email"];
    this.body = json["body"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["postId"] = this.postId;
    data["id"] = this.id;
    data["name"] = this.name;
    data["email"] = this.email;
    data["body"] = this.body;
    return data;
  }
}
