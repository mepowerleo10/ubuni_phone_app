// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Phone _$PhoneFromJson(Map<String, dynamic> json) {
  return Phone(
    json['id'] as int,
    json['name'] as String,
    json['Brand'] as String,
    json['image_url'] as String,
  );
}

Map<String, dynamic> _$PhoneToJson(Phone instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'Brand': instance.brand,
      'image_url': instance.imageUrl,
    };
