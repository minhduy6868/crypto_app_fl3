// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_crypto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewsCrypto _$NewsCryptoFromJson(Map<String, dynamic> json) {
  return _NewsCrypto.fromJson(json);
}

/// @nodoc
mixin _$NewsCrypto {
  @JsonKey(name: 'article_id')
  String? get articleId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get link => throw _privateConstructorUsedError;
  List<String>? get keywords => throw _privateConstructorUsedError;
  dynamic? get creator => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'pubDate')
  String? get pubDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'pubDateTZ')
  String? get pubDateTZ => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'video_url')
  String? get videoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'source_id')
  String? get sourceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'source_name')
  String? get sourceName => throw _privateConstructorUsedError;
  @JsonKey(name: 'source_priority')
  int? get sourcePriority => throw _privateConstructorUsedError;
  @JsonKey(name: 'source_url')
  String? get sourceUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'source_icon')
  String? get sourceIcon => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  @JsonKey(name: 'country')
  List<String>? get countries => throw _privateConstructorUsedError;
  @JsonKey(name: 'category')
  List<String>? get categories => throw _privateConstructorUsedError;
  String? get sentiment => throw _privateConstructorUsedError;
  @JsonKey(name: 'sentiment_stats')
  String? get sentimentStats => throw _privateConstructorUsedError;
  @JsonKey(name: 'ai_tag')
  String? get aiTag => throw _privateConstructorUsedError;
  @JsonKey(name: 'ai_region')
  String? get aiRegion => throw _privateConstructorUsedError;
  @JsonKey(name: 'ai_org')
  String? get aiOrg => throw _privateConstructorUsedError;
  bool? get duplicate => throw _privateConstructorUsedError;

  /// Serializes this NewsCrypto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NewsCrypto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewsCryptoCopyWith<NewsCrypto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsCryptoCopyWith<$Res> {
  factory $NewsCryptoCopyWith(
          NewsCrypto value, $Res Function(NewsCrypto) then) =
      _$NewsCryptoCopyWithImpl<$Res, NewsCrypto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'article_id') String? articleId,
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
      bool? duplicate});
}

/// @nodoc
class _$NewsCryptoCopyWithImpl<$Res, $Val extends NewsCrypto>
    implements $NewsCryptoCopyWith<$Res> {
  _$NewsCryptoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewsCrypto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleId = freezed,
    Object? title = freezed,
    Object? link = freezed,
    Object? keywords = freezed,
    Object? creator = freezed,
    Object? description = freezed,
    Object? content = freezed,
    Object? pubDate = freezed,
    Object? pubDateTZ = freezed,
    Object? imageUrl = freezed,
    Object? videoUrl = freezed,
    Object? sourceId = freezed,
    Object? sourceName = freezed,
    Object? sourcePriority = freezed,
    Object? sourceUrl = freezed,
    Object? sourceIcon = freezed,
    Object? language = freezed,
    Object? countries = freezed,
    Object? categories = freezed,
    Object? sentiment = freezed,
    Object? sentimentStats = freezed,
    Object? aiTag = freezed,
    Object? aiRegion = freezed,
    Object? aiOrg = freezed,
    Object? duplicate = freezed,
  }) {
    return _then(_value.copyWith(
      articleId: freezed == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      keywords: freezed == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      creator: freezed == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      pubDate: freezed == pubDate
          ? _value.pubDate
          : pubDate // ignore: cast_nullable_to_non_nullable
              as String?,
      pubDateTZ: freezed == pubDateTZ
          ? _value.pubDateTZ
          : pubDateTZ // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceId: freezed == sourceId
          ? _value.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceName: freezed == sourceName
          ? _value.sourceName
          : sourceName // ignore: cast_nullable_to_non_nullable
              as String?,
      sourcePriority: freezed == sourcePriority
          ? _value.sourcePriority
          : sourcePriority // ignore: cast_nullable_to_non_nullable
              as int?,
      sourceUrl: freezed == sourceUrl
          ? _value.sourceUrl
          : sourceUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceIcon: freezed == sourceIcon
          ? _value.sourceIcon
          : sourceIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      countries: freezed == countries
          ? _value.countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      sentiment: freezed == sentiment
          ? _value.sentiment
          : sentiment // ignore: cast_nullable_to_non_nullable
              as String?,
      sentimentStats: freezed == sentimentStats
          ? _value.sentimentStats
          : sentimentStats // ignore: cast_nullable_to_non_nullable
              as String?,
      aiTag: freezed == aiTag
          ? _value.aiTag
          : aiTag // ignore: cast_nullable_to_non_nullable
              as String?,
      aiRegion: freezed == aiRegion
          ? _value.aiRegion
          : aiRegion // ignore: cast_nullable_to_non_nullable
              as String?,
      aiOrg: freezed == aiOrg
          ? _value.aiOrg
          : aiOrg // ignore: cast_nullable_to_non_nullable
              as String?,
      duplicate: freezed == duplicate
          ? _value.duplicate
          : duplicate // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsCryptoImplCopyWith<$Res>
    implements $NewsCryptoCopyWith<$Res> {
  factory _$$NewsCryptoImplCopyWith(
          _$NewsCryptoImpl value, $Res Function(_$NewsCryptoImpl) then) =
      __$$NewsCryptoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'article_id') String? articleId,
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
      bool? duplicate});
}

/// @nodoc
class __$$NewsCryptoImplCopyWithImpl<$Res>
    extends _$NewsCryptoCopyWithImpl<$Res, _$NewsCryptoImpl>
    implements _$$NewsCryptoImplCopyWith<$Res> {
  __$$NewsCryptoImplCopyWithImpl(
      _$NewsCryptoImpl _value, $Res Function(_$NewsCryptoImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsCrypto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleId = freezed,
    Object? title = freezed,
    Object? link = freezed,
    Object? keywords = freezed,
    Object? creator = freezed,
    Object? description = freezed,
    Object? content = freezed,
    Object? pubDate = freezed,
    Object? pubDateTZ = freezed,
    Object? imageUrl = freezed,
    Object? videoUrl = freezed,
    Object? sourceId = freezed,
    Object? sourceName = freezed,
    Object? sourcePriority = freezed,
    Object? sourceUrl = freezed,
    Object? sourceIcon = freezed,
    Object? language = freezed,
    Object? countries = freezed,
    Object? categories = freezed,
    Object? sentiment = freezed,
    Object? sentimentStats = freezed,
    Object? aiTag = freezed,
    Object? aiRegion = freezed,
    Object? aiOrg = freezed,
    Object? duplicate = freezed,
  }) {
    return _then(_$NewsCryptoImpl(
      articleId: freezed == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      keywords: freezed == keywords
          ? _value._keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      creator: freezed == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      pubDate: freezed == pubDate
          ? _value.pubDate
          : pubDate // ignore: cast_nullable_to_non_nullable
              as String?,
      pubDateTZ: freezed == pubDateTZ
          ? _value.pubDateTZ
          : pubDateTZ // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceId: freezed == sourceId
          ? _value.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceName: freezed == sourceName
          ? _value.sourceName
          : sourceName // ignore: cast_nullable_to_non_nullable
              as String?,
      sourcePriority: freezed == sourcePriority
          ? _value.sourcePriority
          : sourcePriority // ignore: cast_nullable_to_non_nullable
              as int?,
      sourceUrl: freezed == sourceUrl
          ? _value.sourceUrl
          : sourceUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceIcon: freezed == sourceIcon
          ? _value.sourceIcon
          : sourceIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      countries: freezed == countries
          ? _value._countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      sentiment: freezed == sentiment
          ? _value.sentiment
          : sentiment // ignore: cast_nullable_to_non_nullable
              as String?,
      sentimentStats: freezed == sentimentStats
          ? _value.sentimentStats
          : sentimentStats // ignore: cast_nullable_to_non_nullable
              as String?,
      aiTag: freezed == aiTag
          ? _value.aiTag
          : aiTag // ignore: cast_nullable_to_non_nullable
              as String?,
      aiRegion: freezed == aiRegion
          ? _value.aiRegion
          : aiRegion // ignore: cast_nullable_to_non_nullable
              as String?,
      aiOrg: freezed == aiOrg
          ? _value.aiOrg
          : aiOrg // ignore: cast_nullable_to_non_nullable
              as String?,
      duplicate: freezed == duplicate
          ? _value.duplicate
          : duplicate // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsCryptoImpl implements _NewsCrypto {
  _$NewsCryptoImpl(
      {@JsonKey(name: 'article_id') this.articleId,
      this.title,
      this.link,
      final List<String>? keywords,
      this.creator,
      this.description,
      this.content,
      @JsonKey(name: 'pubDate') this.pubDate,
      @JsonKey(name: 'pubDateTZ') this.pubDateTZ,
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'video_url') this.videoUrl,
      @JsonKey(name: 'source_id') this.sourceId,
      @JsonKey(name: 'source_name') this.sourceName,
      @JsonKey(name: 'source_priority') this.sourcePriority,
      @JsonKey(name: 'source_url') this.sourceUrl,
      @JsonKey(name: 'source_icon') this.sourceIcon,
      this.language,
      @JsonKey(name: 'country') final List<String>? countries,
      @JsonKey(name: 'category') final List<String>? categories,
      this.sentiment,
      @JsonKey(name: 'sentiment_stats') this.sentimentStats,
      @JsonKey(name: 'ai_tag') this.aiTag,
      @JsonKey(name: 'ai_region') this.aiRegion,
      @JsonKey(name: 'ai_org') this.aiOrg,
      this.duplicate})
      : _keywords = keywords,
        _countries = countries,
        _categories = categories;

  factory _$NewsCryptoImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsCryptoImplFromJson(json);

  @override
  @JsonKey(name: 'article_id')
  final String? articleId;
  @override
  final String? title;
  @override
  final String? link;
  final List<String>? _keywords;
  @override
  List<String>? get keywords {
    final value = _keywords;
    if (value == null) return null;
    if (_keywords is EqualUnmodifiableListView) return _keywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final dynamic? creator;
  @override
  final String? description;
  @override
  final String? content;
  @override
  @JsonKey(name: 'pubDate')
  final String? pubDate;
  @override
  @JsonKey(name: 'pubDateTZ')
  final String? pubDateTZ;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'video_url')
  final String? videoUrl;
  @override
  @JsonKey(name: 'source_id')
  final String? sourceId;
  @override
  @JsonKey(name: 'source_name')
  final String? sourceName;
  @override
  @JsonKey(name: 'source_priority')
  final int? sourcePriority;
  @override
  @JsonKey(name: 'source_url')
  final String? sourceUrl;
  @override
  @JsonKey(name: 'source_icon')
  final String? sourceIcon;
  @override
  final String? language;
  final List<String>? _countries;
  @override
  @JsonKey(name: 'country')
  List<String>? get countries {
    final value = _countries;
    if (value == null) return null;
    if (_countries is EqualUnmodifiableListView) return _countries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _categories;
  @override
  @JsonKey(name: 'category')
  List<String>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? sentiment;
  @override
  @JsonKey(name: 'sentiment_stats')
  final String? sentimentStats;
  @override
  @JsonKey(name: 'ai_tag')
  final String? aiTag;
  @override
  @JsonKey(name: 'ai_region')
  final String? aiRegion;
  @override
  @JsonKey(name: 'ai_org')
  final String? aiOrg;
  @override
  final bool? duplicate;

  @override
  String toString() {
    return 'NewsCrypto(articleId: $articleId, title: $title, link: $link, keywords: $keywords, creator: $creator, description: $description, content: $content, pubDate: $pubDate, pubDateTZ: $pubDateTZ, imageUrl: $imageUrl, videoUrl: $videoUrl, sourceId: $sourceId, sourceName: $sourceName, sourcePriority: $sourcePriority, sourceUrl: $sourceUrl, sourceIcon: $sourceIcon, language: $language, countries: $countries, categories: $categories, sentiment: $sentiment, sentimentStats: $sentimentStats, aiTag: $aiTag, aiRegion: $aiRegion, aiOrg: $aiOrg, duplicate: $duplicate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsCryptoImpl &&
            (identical(other.articleId, articleId) ||
                other.articleId == articleId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.link, link) || other.link == link) &&
            const DeepCollectionEquality().equals(other._keywords, _keywords) &&
            const DeepCollectionEquality().equals(other.creator, creator) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.pubDate, pubDate) || other.pubDate == pubDate) &&
            (identical(other.pubDateTZ, pubDateTZ) ||
                other.pubDateTZ == pubDateTZ) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.sourceId, sourceId) ||
                other.sourceId == sourceId) &&
            (identical(other.sourceName, sourceName) ||
                other.sourceName == sourceName) &&
            (identical(other.sourcePriority, sourcePriority) ||
                other.sourcePriority == sourcePriority) &&
            (identical(other.sourceUrl, sourceUrl) ||
                other.sourceUrl == sourceUrl) &&
            (identical(other.sourceIcon, sourceIcon) ||
                other.sourceIcon == sourceIcon) &&
            (identical(other.language, language) ||
                other.language == language) &&
            const DeepCollectionEquality()
                .equals(other._countries, _countries) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.sentiment, sentiment) ||
                other.sentiment == sentiment) &&
            (identical(other.sentimentStats, sentimentStats) ||
                other.sentimentStats == sentimentStats) &&
            (identical(other.aiTag, aiTag) || other.aiTag == aiTag) &&
            (identical(other.aiRegion, aiRegion) ||
                other.aiRegion == aiRegion) &&
            (identical(other.aiOrg, aiOrg) || other.aiOrg == aiOrg) &&
            (identical(other.duplicate, duplicate) ||
                other.duplicate == duplicate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        articleId,
        title,
        link,
        const DeepCollectionEquality().hash(_keywords),
        const DeepCollectionEquality().hash(creator),
        description,
        content,
        pubDate,
        pubDateTZ,
        imageUrl,
        videoUrl,
        sourceId,
        sourceName,
        sourcePriority,
        sourceUrl,
        sourceIcon,
        language,
        const DeepCollectionEquality().hash(_countries),
        const DeepCollectionEquality().hash(_categories),
        sentiment,
        sentimentStats,
        aiTag,
        aiRegion,
        aiOrg,
        duplicate
      ]);

  /// Create a copy of NewsCrypto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsCryptoImplCopyWith<_$NewsCryptoImpl> get copyWith =>
      __$$NewsCryptoImplCopyWithImpl<_$NewsCryptoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsCryptoImplToJson(
      this,
    );
  }
}

abstract class _NewsCrypto implements NewsCrypto {
  factory _NewsCrypto(
      {@JsonKey(name: 'article_id') final String? articleId,
      final String? title,
      final String? link,
      final List<String>? keywords,
      final dynamic? creator,
      final String? description,
      final String? content,
      @JsonKey(name: 'pubDate') final String? pubDate,
      @JsonKey(name: 'pubDateTZ') final String? pubDateTZ,
      @JsonKey(name: 'image_url') final String? imageUrl,
      @JsonKey(name: 'video_url') final String? videoUrl,
      @JsonKey(name: 'source_id') final String? sourceId,
      @JsonKey(name: 'source_name') final String? sourceName,
      @JsonKey(name: 'source_priority') final int? sourcePriority,
      @JsonKey(name: 'source_url') final String? sourceUrl,
      @JsonKey(name: 'source_icon') final String? sourceIcon,
      final String? language,
      @JsonKey(name: 'country') final List<String>? countries,
      @JsonKey(name: 'category') final List<String>? categories,
      final String? sentiment,
      @JsonKey(name: 'sentiment_stats') final String? sentimentStats,
      @JsonKey(name: 'ai_tag') final String? aiTag,
      @JsonKey(name: 'ai_region') final String? aiRegion,
      @JsonKey(name: 'ai_org') final String? aiOrg,
      final bool? duplicate}) = _$NewsCryptoImpl;

  factory _NewsCrypto.fromJson(Map<String, dynamic> json) =
      _$NewsCryptoImpl.fromJson;

  @override
  @JsonKey(name: 'article_id')
  String? get articleId;
  @override
  String? get title;
  @override
  String? get link;
  @override
  List<String>? get keywords;
  @override
  dynamic? get creator;
  @override
  String? get description;
  @override
  String? get content;
  @override
  @JsonKey(name: 'pubDate')
  String? get pubDate;
  @override
  @JsonKey(name: 'pubDateTZ')
  String? get pubDateTZ;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'video_url')
  String? get videoUrl;
  @override
  @JsonKey(name: 'source_id')
  String? get sourceId;
  @override
  @JsonKey(name: 'source_name')
  String? get sourceName;
  @override
  @JsonKey(name: 'source_priority')
  int? get sourcePriority;
  @override
  @JsonKey(name: 'source_url')
  String? get sourceUrl;
  @override
  @JsonKey(name: 'source_icon')
  String? get sourceIcon;
  @override
  String? get language;
  @override
  @JsonKey(name: 'country')
  List<String>? get countries;
  @override
  @JsonKey(name: 'category')
  List<String>? get categories;
  @override
  String? get sentiment;
  @override
  @JsonKey(name: 'sentiment_stats')
  String? get sentimentStats;
  @override
  @JsonKey(name: 'ai_tag')
  String? get aiTag;
  @override
  @JsonKey(name: 'ai_region')
  String? get aiRegion;
  @override
  @JsonKey(name: 'ai_org')
  String? get aiOrg;
  @override
  bool? get duplicate;

  /// Create a copy of NewsCrypto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewsCryptoImplCopyWith<_$NewsCryptoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
