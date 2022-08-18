import 'package:json_annotation/json_annotation.dart';
part 'album_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class AlbumModel {
    AlbumModel({
        this.id,
        this.title,
    });

    int? id;
    String? title;

factory AlbumModel.fromJson(Map<String, dynamic> json) =>
      _$AlbumModelFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumModelToJson(this);
}