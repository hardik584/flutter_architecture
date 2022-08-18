// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GalleryModel _$GalleryModelFromJson(Map<String, dynamic> json) => GalleryModel(
      json['id'] as int,
      AlbumModel.fromJson(json['album'] as Map<String, dynamic>),
      (json['photo_list'] as List<dynamic>)
          .map((e) => PhotoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GalleryModelToJson(GalleryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'album': instance.album,
      'photo_list': instance.photoList,
    };
