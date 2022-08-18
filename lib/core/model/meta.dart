import 'package:json_annotation/json_annotation.dart';
part 'meta.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class Meta {
  final int? code;
  final String? message;
  final String? token;
  final int? perPage;
  final int? offset;
  final int? total;

  Meta(
      {this.code,
      this.message,
      this.token,
      this.offset,
      this.perPage,
      this.total});

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
