// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'meta.freezed.dart';
part 'meta.g.dart';

@freezed
class Meta with _$Meta {
  @JsonSerializable(includeIfNull: false)
  const factory Meta({
    @JsonKey(name: 'current_page', includeFromJson: true, includeToJson: false)
    @Default(0)
    int currentPage,
    @JsonKey(name: 'next_page', includeFromJson: true, includeToJson: false)
    @Default(0)
    int nextPage,
    @JsonKey(name: 'prev_page', includeFromJson: true, includeToJson: false)
    @Default(0)
    int prevPage,
    @JsonKey(name: 'total_pages', includeFromJson: true, includeToJson: false)
    @Default(0)
    int totalPages,
    @JsonKey(name: 'total_count', includeFromJson: true, includeToJson: false)
    @Default(0)
    int totalCount,
  }) = _Meta;

  static const empty = Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}
