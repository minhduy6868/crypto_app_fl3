// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TopicNewsImpl _$$TopicNewsImplFromJson(Map<String, dynamic> json) =>
    _$TopicNewsImpl(
      topic: json['topic'] as String?,
      relevanceScore: (json['relevance_score'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$TopicNewsImplToJson(_$TopicNewsImpl instance) =>
    <String, dynamic>{
      'topic': instance.topic,
      'relevance_score': instance.relevanceScore,
    };
