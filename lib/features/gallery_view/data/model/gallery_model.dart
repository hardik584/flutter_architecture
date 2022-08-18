import 'package:demo/features/gallery_view/data/model/album_model.dart';
import 'package:demo/features/gallery_view/data/model/photos_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'gallery_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class GalleryModel {
  GalleryModel(this.id, this.album, this.photoList);
  int id;
  AlbumModel album;
  List<PhotoModel> photoList;

  factory GalleryModel.fromJson(Map<String, dynamic> json) =>
      _$GalleryModelFromJson(json);
  Map<String, dynamic> toJson() => _$GalleryModelToJson(this);

}
