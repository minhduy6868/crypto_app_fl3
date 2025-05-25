// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_crypto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsCryptoImpl _$$NewsCryptoImplFromJson(Map<String, dynamic> json) =>
    _$NewsCryptoImpl(
      articleId: json['article_id'] as String?,
      title: json['title'] as String?,
      link: json['link'] as String?,
      keywords: (json['keywords'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      creator: json['creator'],
      description: json['description'] as String?,
      content: json['content'] as String?,
      pubDate: json['pubDate'] as String?,
      pubDateTZ: json['pubDateTZ'] as String?,
      imageUrl: json['image_url'] as String?,
      videoUrl: json['video_url'] as String?,
      sourceId: json['source_id'] as String?,
      sourceName: json['source_name'] as String?,
      sourcePriority: (json['source_priority'] as num?)?.toInt(),
      sourceUrl: json['source_url'] as String?,
      sourceIcon: json['source_icon'] as String?,
      language: json['language'] as String?,
      countries:
          (json['country'] as List<dynamic>?)?.map((e) => e as String).toList(),
      categories: (json['category'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      sentiment: json['sentiment'] as String?,
      sentimentStats: json['sentiment_stats'] as String?,
      aiTag: json['ai_tag'] as String?,
      aiRegion: json['ai_region'] as String?,
      aiOrg: json['ai_org'] as String?,
      duplicate: json['duplicate'] as bool?,
    );

Map<String, dynamic> _$$NewsCryptoImplToJson(_$NewsCryptoImpl instance) =>
    <String, dynamic>{
      'article_id': instance.articleId,
      'title': instance.title,
      'link': instance.link,
      'keywords': instance.keywords,
      'creator': instance.creator,
      'description': instance.description,
      'content': instance.content,
      'pubDate': instance.pubDate,
      'pubDateTZ': instance.pubDateTZ,
      'image_url': instance.imageUrl,
      'video_url': instance.videoUrl,
      'source_id': instance.sourceId,
      'source_name': instance.sourceName,
      'source_priority': instance.sourcePriority,
      'source_url': instance.sourceUrl,
      'source_icon': instance.sourceIcon,
      'language': instance.language,
      'country': instance.countries,
      'category': instance.categories,
      'sentiment': instance.sentiment,
      'sentiment_stats': instance.sentimentStats,
      'ai_tag': instance.aiTag,
      'ai_region': instance.aiRegion,
      'ai_org': instance.aiOrg,
      'duplicate': instance.duplicate,
    };
