import 'package:freezed_annotation/freezed_annotation.dart';

import '../topic_news/topic_news.dart';

part 'news.freezed.dart';
part 'news.g.dart';

@freezed
class News with _$News {
  factory News({
    String? title,
    String? url,
    @JsonKey(name: 'time_published') DateTime? timePublished,
    List<String>? authors,
    String? summary,
    @JsonKey(name: 'banner_image') String? bannerImage,
    String? source,
    @JsonKey(name: 'category_within_source') String? categoryWithinSource,
    @JsonKey(name: 'source_domain') String? sourceDomain,
    List<TopicNews>? topics,
    @JsonKey(name: 'overall_sentiment_score') double? overallSentimentScore,
    @JsonKey(name: 'overall_sentiment_label') String? overallSentimentLabel,
    //@JsonKey(name: 'ticker_sentiment') List<TickerSentiment>? tickerSentiment,
  }) = _News;

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}




