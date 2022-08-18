import 'package:json_annotation/json_annotation.dart';
part 'photos_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class PhotoModel {
    PhotoModel({
        this.albumId,
        this.id,
        this.title,
        this.url,
        this.thumbnailUrl,
    });

    int? albumId;
    int? id;
    String? title;
    String? url;
    String? thumbnailUrl;

    factory PhotoModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoModelFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoModelToJson(this);

}