// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      code: json['code'] as int?,
      message: json['message'] as String?,
      token: json['token'] as String?,
      offset: json['offset'] as int?,
      perPage: json['per_page'] as int?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'token': instance.token,
      'per_page': instance.perPage,
      'offset': instance.offset,
      'total': instance.total,
    };
