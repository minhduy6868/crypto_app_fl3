// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic_news.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TopicNews _$TopicNewsFromJson(Map<String, dynamic> json) {
  return _TopicNews.fromJson(json);
}

/// @nodoc
mixin _$TopicNews {
  String? get topic => throw _privateConstructorUsedError;
  @JsonKey(name: 'relevance_score')
  double? get relevanceScore => throw _privateConstructorUsedError;

  /// Serializes this TopicNews to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TopicNews
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TopicNewsCopyWith<TopicNews> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicNewsCopyWith<$Res> {
  factory $TopicNewsCopyWith(TopicNews value, $Res Function(TopicNews) then) =
      _$TopicNewsCopyWithImpl<$Res, TopicNews>;
  @useResult
  $Res call(
      {String? topic,
      @JsonKey(name: 'relevance_score') double? relevanceScore});
}

/// @nodoc
class _$TopicNewsCopyWithImpl<$Res, $Val extends TopicNews>
    implements $TopicNewsCopyWith<$Res> {
  _$TopicNewsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TopicNews
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topic = freezed,
    Object? relevanceScore = freezed,
  }) {
    return _then(_value.copyWith(
      topic: freezed == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String?,
      relevanceScore: freezed == relevanceScore
          ? _value.relevanceScore
          : relevanceScore // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopicNewsImplCopyWith<$Res>
    implements $TopicNewsCopyWith<$Res> {
  factory _$$TopicNewsImplCopyWith(
          _$TopicNewsImpl value, $Res Function(_$TopicNewsImpl) then) =
      __$$TopicNewsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? topic,
      @JsonKey(name: 'relevance_score') double? relevanceScore});
}

/// @nodoc
class __$$TopicNewsImplCopyWithImpl<$Res>
    extends _$TopicNewsCopyWithImpl<$Res, _$TopicNewsImpl>
    implements _$$TopicNewsImplCopyWith<$Res> {
  __$$TopicNewsImplCopyWithImpl(
      _$TopicNewsImpl _value, $Res Function(_$TopicNewsImpl) _then)
      : super(_value, _then);

  /// Create a copy of TopicNews
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topic = freezed,
    Object? relevanceScore = freezed,
  }) {
    return _then(_$TopicNewsImpl(
      topic: freezed == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String?,
      relevanceScore: freezed == relevanceScore
          ? _value.relevanceScore
          : relevanceScore // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TopicNewsImpl implements _TopicNews {
  _$TopicNewsImpl(
      {this.topic, @JsonKey(name: 'relevance_score') this.relevanceScore});

  factory _$TopicNewsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopicNewsImplFromJson(json);

  @override
  final String? topic;
  @override
  @JsonKey(name: 'relevance_score')
  final double? relevanceScore;

  @override
  String toString() {
    return 'TopicNews(topic: $topic, relevanceScore: $relevanceScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopicNewsImpl &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.relevanceScore, relevanceScore) ||
                other.relevanceScore == relevanceScore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, topic, relevanceScore);

  /// Create a copy of TopicNews
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TopicNewsImplCopyWith<_$TopicNewsImpl> get copyWith =>
      __$$TopicNewsImplCopyWithImpl<_$TopicNewsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopicNewsImplToJson(
      this,
    );
  }
}

abstract class _TopicNews implements TopicNews {
  factory _TopicNews(
          {final String? topic,
          @JsonKey(name: 'relevance_score') final double? relevanceScore}) =
      _$TopicNewsImpl;

  factory _TopicNews.fromJson(Map<String, dynamic> json) =
      _$TopicNewsImpl.fromJson;

  @override
  String? get topic;
  @override
  @JsonKey(name: 'relevance_score')
  double? get relevanceScore;

  /// Create a copy of TopicNews
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TopicNewsImplCopyWith<_$TopicNewsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
