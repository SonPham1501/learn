


import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

@JsonSerializable()
class City {
  String? id;
  String? name;
  String? order;
  String? type;
  String? count;
  String? countVl;
  String? countTw;
  String? postCode;

  City({this.type, this.name, this.id, this.count, this.countTw, this.countVl, this.order, this.postCode});

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}