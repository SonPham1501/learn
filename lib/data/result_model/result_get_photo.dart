import 'dart:convert';

List<ResultGetPhotos> listResultGetPhotoFromJson(String str) => List<ResultGetPhotos>.from(json.decode(str).map((e) => ResultGetPhotos.fromJson(e)));

String listResultGetPhotoToJson(List<ResultGetPhotos> data) => json.encode(data.map((e) => e.toJson()).toList());

class ResultGetPhotos {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  ResultGetPhotos({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  ResultGetPhotos.fromJson(Map<String, dynamic> json) {
    this.albumId = json["albumId"];
    this.id = json["id"];
    this.title = json["title"];
    this.url = json["url"];
    this.thumbnailUrl = json["thumbnailUrl"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["albumId"] = this.albumId;
    data["id"] = this.id;
    data["title"] = this.title;
    data["url"] = this.url;
    data["thumbnailUrl"] = this.thumbnailUrl;
    return data;
  }
}
