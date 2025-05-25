import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_crypto.freezed.dart';
part 'news_crypto.g.dart';

@freezed
class NewsCrypto with _$NewsCrypto {
  factory NewsCrypto({
    @JsonKey(name: 'article_id') String? articleId,
    String? title,
    String? link,
    List<String>? keywords,
    dynamic? creator,
    String? description,
    String? content,
    @JsonKey(name: 'pubDate') String? pubDate,
    @JsonKey(name: 'pubDateTZ') String? pubDateTZ,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'video_url') String? videoUrl,
    @JsonKey(name: 'source_id') String? sourceId,
    @JsonKey(name: 'source_name') String? sourceName,
    @JsonKey(name: 'source_priority') int? sourcePriority,
    @JsonKey(name: 'source_url') String? sourceUrl,
    @JsonKey(name: 'source_icon') String? sourceIcon,
    String? language,
    @JsonKey(name: 'country') List<String>? countries,
    @JsonKey(name: 'category') List<String>? categories,
    String? sentiment,
    @JsonKey(name: 'sentiment_stats') String? sentimentStats,
    @JsonKey(name: 'ai_tag') String? aiTag,
    @JsonKey(name: 'ai_region') String? aiRegion,
    @JsonKey(name: 'ai_org') String? aiOrg,
    bool? duplicate,
  }) = _NewsCrypto;

  factory NewsCrypto.fromJson(Map<String, dynamic> json) =>
      _$NewsCryptoFromJson(json);
}