// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

City _$CityFromJson(Map<String, dynamic> json) {
  return City(
    type: json['type'] as String?,
    name: json['name'] as String?,
    id: json['id'] as String?,
    count: json['count'] as String?,
    countTw: json['countTw'] as String?,
    countVl: json['countVl'] as String?,
    order: json['order'] as String?,
    postCode: json['postCode'] as String?,
  );
}

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'type': instance.type,
      'count': instance.count,
      'countVl': instance.countVl,
      'countTw': instance.countTw,
      'postCode': instance.postCode,
    };
