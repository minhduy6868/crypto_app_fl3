// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsImpl _$$NewsImplFromJson(Map<String, dynamic> json) => _$NewsImpl(
      title: json['title'] as String?,
      url: json['url'] as String?,
      timePublished: json['time_published'] == null
          ? null
          : DateTime.parse(json['time_published'] as String),
      authors:
          (json['authors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      summary: json['summary'] as String?,
      bannerImage: json['banner_image'] as String?,
      source: json['source'] as String?,
      categoryWithinSource: json['category_within_source'] as String?,
      sourceDomain: json['source_domain'] as String?,
      topics: (json['topics'] as List<dynamic>?)
          ?.map((e) => TopicNews.fromJson(e as Map<String, dynamic>))
          .toList(),
      overallSentimentScore:
          (json['overall_sentiment_score'] as num?)?.toDouble(),
      overallSentimentLabel: json['overall_sentiment_label'] as String?,
    );

Map<String, dynamic> _$$NewsImplToJson(_$NewsImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'time_published': instance.timePublished?.toIso8601String(),
      'authors': instance.authors,
      'summary': instance.summary,
      'banner_image': instance.bannerImage,
      'source': instance.source,
      'category_within_source': instance.categoryWithinSource,
      'source_domain': instance.sourceDomain,
      'topics': instance.topics,
      'overall_sentiment_score': instance.overallSentimentScore,
      'overall_sentiment_label': instance.overallSentimentLabel,
    };
