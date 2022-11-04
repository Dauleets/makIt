// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'persons.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonEntity _$PersonEntityFromJson(Map<String, dynamic> json) => PersonEntity(
      name: json['name'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$PersonEntityToJson(PersonEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
    };
