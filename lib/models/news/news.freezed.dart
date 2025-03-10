// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

News _$NewsFromJson(Map<String, dynamic> json) {
  return _News.fromJson(json);
}

/// @nodoc
mixin _$News {
  String? get title => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_published')
  DateTime? get timePublished => throw _privateConstructorUsedError;
  List<String>? get authors => throw _privateConstructorUsedError;
  String? get summary => throw _privateConstructorUsedError;
  @JsonKey(name: 'banner_image')
  String? get bannerImage => throw _privateConstructorUsedError;
  String? get source => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_within_source')
  String? get categoryWithinSource => throw _privateConstructorUsedError;
  @JsonKey(name: 'source_domain')
  String? get sourceDomain => throw _privateConstructorUsedError;
  List<TopicNews>? get topics => throw _privateConstructorUsedError;
  @JsonKey(name: 'overall_sentiment_score')
  double? get overallSentimentScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'overall_sentiment_label')
  String? get overallSentimentLabel => throw _privateConstructorUsedError;

  /// Serializes this News to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of News
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewsCopyWith<News> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsCopyWith<$Res> {
  factory $NewsCopyWith(News value, $Res Function(News) then) =
      _$NewsCopyWithImpl<$Res, News>;
  @useResult
  $Res call(
      {String? title,
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
      @JsonKey(name: 'overall_sentiment_label') String? overallSentimentLabel});
}

/// @nodoc
class _$NewsCopyWithImpl<$Res, $Val extends News>
    implements $NewsCopyWith<$Res> {
  _$NewsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of News
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? url = freezed,
    Object? timePublished = freezed,
    Object? authors = freezed,
    Object? summary = freezed,
    Object? bannerImage = freezed,
    Object? source = freezed,
    Object? categoryWithinSource = freezed,
    Object? sourceDomain = freezed,
    Object? topics = freezed,
    Object? overallSentimentScore = freezed,
    Object? overallSentimentLabel = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      timePublished: freezed == timePublished
          ? _value.timePublished
          : timePublished // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      authors: freezed == authors
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      bannerImage: freezed == bannerImage
          ? _value.bannerImage
          : bannerImage // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryWithinSource: freezed == categoryWithinSource
          ? _value.categoryWithinSource
          : categoryWithinSource // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceDomain: freezed == sourceDomain
          ? _value.sourceDomain
          : sourceDomain // ignore: cast_nullable_to_non_nullable
              as String?,
      topics: freezed == topics
          ? _value.topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<TopicNews>?,
      overallSentimentScore: freezed == overallSentimentScore
          ? _value.overallSentimentScore
          : overallSentimentScore // ignore: cast_nullable_to_non_nullable
              as double?,
      overallSentimentLabel: freezed == overallSentimentLabel
          ? _value.overallSentimentLabel
          : overallSentimentLabel // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsImplCopyWith<$Res> implements $NewsCopyWith<$Res> {
  factory _$$NewsImplCopyWith(
          _$NewsImpl value, $Res Function(_$NewsImpl) then) =
      __$$NewsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
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
      @JsonKey(name: 'overall_sentiment_label') String? overallSentimentLabel});
}

/// @nodoc
class __$$NewsImplCopyWithImpl<$Res>
    extends _$NewsCopyWithImpl<$Res, _$NewsImpl>
    implements _$$NewsImplCopyWith<$Res> {
  __$$NewsImplCopyWithImpl(_$NewsImpl _value, $Res Function(_$NewsImpl) _then)
      : super(_value, _then);

  /// Create a copy of News
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? url = freezed,
    Object? timePublished = freezed,
    Object? authors = freezed,
    Object? summary = freezed,
    Object? bannerImage = freezed,
    Object? source = freezed,
    Object? categoryWithinSource = freezed,
    Object? sourceDomain = freezed,
    Object? topics = freezed,
    Object? overallSentimentScore = freezed,
    Object? overallSentimentLabel = freezed,
  }) {
    return _then(_$NewsImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      timePublished: freezed == timePublished
          ? _value.timePublished
          : timePublished // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      authors: freezed == authors
          ? _value._authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      bannerImage: freezed == bannerImage
          ? _value.bannerImage
          : bannerImage // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryWithinSource: freezed == categoryWithinSource
          ? _value.categoryWithinSource
          : categoryWithinSource // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceDomain: freezed == sourceDomain
          ? _value.sourceDomain
          : sourceDomain // ignore: cast_nullable_to_non_nullable
              as String?,
      topics: freezed == topics
          ? _value._topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<TopicNews>?,
      overallSentimentScore: freezed == overallSentimentScore
          ? _value.overallSentimentScore
          : overallSentimentScore // ignore: cast_nullable_to_non_nullable
              as double?,
      overallSentimentLabel: freezed == overallSentimentLabel
          ? _value.overallSentimentLabel
          : overallSentimentLabel // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsImpl implements _News {
  _$NewsImpl(
      {this.title,
      this.url,
      @JsonKey(name: 'time_published') this.timePublished,
      final List<String>? authors,
      this.summary,
      @JsonKey(name: 'banner_image') this.bannerImage,
      this.source,
      @JsonKey(name: 'category_within_source') this.categoryWithinSource,
      @JsonKey(name: 'source_domain') this.sourceDomain,
      final List<TopicNews>? topics,
      @JsonKey(name: 'overall_sentiment_score') this.overallSentimentScore,
      @JsonKey(name: 'overall_sentiment_label') this.overallSentimentLabel})
      : _authors = authors,
        _topics = topics;

  factory _$NewsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsImplFromJson(json);

  @override
  final String? title;
  @override
  final String? url;
  @override
  @JsonKey(name: 'time_published')
  final DateTime? timePublished;
  final List<String>? _authors;
  @override
  List<String>? get authors {
    final value = _authors;
    if (value == null) return null;
    if (_authors is EqualUnmodifiableListView) return _authors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? summary;
  @override
  @JsonKey(name: 'banner_image')
  final String? bannerImage;
  @override
  final String? source;
  @override
  @JsonKey(name: 'category_within_source')
  final String? categoryWithinSource;
  @override
  @JsonKey(name: 'source_domain')
  final String? sourceDomain;
  final List<TopicNews>? _topics;
  @override
  List<TopicNews>? get topics {
    final value = _topics;
    if (value == null) return null;
    if (_topics is EqualUnmodifiableListView) return _topics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'overall_sentiment_score')
  final double? overallSentimentScore;
  @override
  @JsonKey(name: 'overall_sentiment_label')
  final String? overallSentimentLabel;

  @override
  String toString() {
    return 'News(title: $title, url: $url, timePublished: $timePublished, authors: $authors, summary: $summary, bannerImage: $bannerImage, source: $source, categoryWithinSource: $categoryWithinSource, sourceDomain: $sourceDomain, topics: $topics, overallSentimentScore: $overallSentimentScore, overallSentimentLabel: $overallSentimentLabel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.timePublished, timePublished) ||
                other.timePublished == timePublished) &&
            const DeepCollectionEquality().equals(other._authors, _authors) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.bannerImage, bannerImage) ||
                other.bannerImage == bannerImage) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.categoryWithinSource, categoryWithinSource) ||
                other.categoryWithinSource == categoryWithinSource) &&
            (identical(other.sourceDomain, sourceDomain) ||
                other.sourceDomain == sourceDomain) &&
            const DeepCollectionEquality().equals(other._topics, _topics) &&
            (identical(other.overallSentimentScore, overallSentimentScore) ||
                other.overallSentimentScore == overallSentimentScore) &&
            (identical(other.overallSentimentLabel, overallSentimentLabel) ||
                other.overallSentimentLabel == overallSentimentLabel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      url,
      timePublished,
      const DeepCollectionEquality().hash(_authors),
      summary,
      bannerImage,
      source,
      categoryWithinSource,
      sourceDomain,
      const DeepCollectionEquality().hash(_topics),
      overallSentimentScore,
      overallSentimentLabel);

  /// Create a copy of News
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsImplCopyWith<_$NewsImpl> get copyWith =>
      __$$NewsImplCopyWithImpl<_$NewsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsImplToJson(
      this,
    );
  }
}

abstract class _News implements News {
  factory _News(
      {final String? title,
      final String? url,
      @JsonKey(name: 'time_published') final DateTime? timePublished,
      final List<String>? authors,
      final String? summary,
      @JsonKey(name: 'banner_image') final String? bannerImage,
      final String? source,
      @JsonKey(name: 'category_within_source')
      final String? categoryWithinSource,
      @JsonKey(name: 'source_domain') final String? sourceDomain,
      final List<TopicNews>? topics,
      @JsonKey(name: 'overall_sentiment_score')
      final double? overallSentimentScore,
      @JsonKey(name: 'overall_sentiment_label')
      final String? overallSentimentLabel}) = _$NewsImpl;

  factory _News.fromJson(Map<String, dynamic> json) = _$NewsImpl.fromJson;

  @override
  String? get title;
  @override
  String? get url;
  @override
  @JsonKey(name: 'time_published')
  DateTime? get timePublished;
  @override
  List<String>? get authors;
  @override
  String? get summary;
  @override
  @JsonKey(name: 'banner_image')
  String? get bannerImage;
  @override
  String? get source;
  @override
  @JsonKey(name: 'category_within_source')
  String? get categoryWithinSource;
  @override
  @JsonKey(name: 'source_domain')
  String? get sourceDomain;
  @override
  List<TopicNews>? get topics;
  @override
  @JsonKey(name: 'overall_sentiment_score')
  double? get overallSentimentScore;
  @override
  @JsonKey(name: 'overall_sentiment_label')
  String? get overallSentimentLabel;

  /// Create a copy of News
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewsImplCopyWith<_$NewsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
