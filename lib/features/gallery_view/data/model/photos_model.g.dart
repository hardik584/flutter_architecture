// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photos_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoModel _$PhotoModelFromJson(Map<String, dynamic> json) => PhotoModel(
      albumId: json['album_id'] as int?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      url: json['url'] as String?,
      thumbnailUrl: json['thumbnail_url'] as String?,
    );

Map<String, dynamic> _$PhotoModelToJson(PhotoModel instance) =>
    <String, dynamic>{
      'album_id': instance.albumId,
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnail_url': instance.thumbnailUrl,
    };
