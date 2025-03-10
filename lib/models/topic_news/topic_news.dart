import 'package:freezed_annotation/freezed_annotation.dart';

part 'topic_news.freezed.dart';
part 'topic_news.g.dart';

@freezed
class TopicNews with _$TopicNews {
  factory TopicNews({
    String? topic,
    @JsonKey(name: 'relevance_score') double? relevanceScore,
  }) = _TopicNews;

  factory TopicNews.fromJson(Map<String, dynamic> json) => _$TopicNewsFromJson(json);
}