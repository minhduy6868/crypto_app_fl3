// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'converted_market.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConvertedMarket _$ConvertedMarketFromJson(Map<String, dynamic> json) {
  return _ConvertedMarket.fromJson(json);
}

/// @nodoc
mixin _$ConvertedMarket {
  double? get btc => throw _privateConstructorUsedError;
  double? get eth => throw _privateConstructorUsedError;
  double? get usd => throw _privateConstructorUsedError;

  /// Serializes this ConvertedMarket to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConvertedMarket
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConvertedMarketCopyWith<ConvertedMarket> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConvertedMarketCopyWith<$Res> {
  factory $ConvertedMarketCopyWith(
          ConvertedMarket value, $Res Function(ConvertedMarket) then) =
      _$ConvertedMarketCopyWithImpl<$Res, ConvertedMarket>;
  @useResult
  $Res call({double? btc, double? eth, double? usd});
}

/// @nodoc
class _$ConvertedMarketCopyWithImpl<$Res, $Val extends ConvertedMarket>
    implements $ConvertedMarketCopyWith<$Res> {
  _$ConvertedMarketCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConvertedMarket
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? btc = freezed,
    Object? eth = freezed,
    Object? usd = freezed,
  }) {
    return _then(_value.copyWith(
      btc: freezed == btc
          ? _value.btc
          : btc // ignore: cast_nullable_to_non_nullable
              as double?,
      eth: freezed == eth
          ? _value.eth
          : eth // ignore: cast_nullable_to_non_nullable
              as double?,
      usd: freezed == usd
          ? _value.usd
          : usd // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConvertedMarketImplCopyWith<$Res>
    implements $ConvertedMarketCopyWith<$Res> {
  factory _$$ConvertedMarketImplCopyWith(_$ConvertedMarketImpl value,
          $Res Function(_$ConvertedMarketImpl) then) =
      __$$ConvertedMarketImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? btc, double? eth, double? usd});
}

/// @nodoc
class __$$ConvertedMarketImplCopyWithImpl<$Res>
    extends _$ConvertedMarketCopyWithImpl<$Res, _$ConvertedMarketImpl>
    implements _$$ConvertedMarketImplCopyWith<$Res> {
  __$$ConvertedMarketImplCopyWithImpl(
      _$ConvertedMarketImpl _value, $Res Function(_$ConvertedMarketImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConvertedMarket
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? btc = freezed,
    Object? eth = freezed,
    Object? usd = freezed,
  }) {
    return _then(_$ConvertedMarketImpl(
      btc: freezed == btc
          ? _value.btc
          : btc // ignore: cast_nullable_to_non_nullable
              as double?,
      eth: freezed == eth
          ? _value.eth
          : eth // ignore: cast_nullable_to_non_nullable
              as double?,
      usd: freezed == usd
          ? _value.usd
          : usd // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConvertedMarketImpl implements _ConvertedMarket {
  _$ConvertedMarketImpl({this.btc, this.eth, this.usd});

  factory _$ConvertedMarketImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConvertedMarketImplFromJson(json);

  @override
  final double? btc;
  @override
  final double? eth;
  @override
  final double? usd;

  @override
  String toString() {
    return 'ConvertedMarket(btc: $btc, eth: $eth, usd: $usd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConvertedMarketImpl &&
            (identical(other.btc, btc) || other.btc == btc) &&
            (identical(other.eth, eth) || other.eth == eth) &&
            (identical(other.usd, usd) || other.usd == usd));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, btc, eth, usd);

  /// Create a copy of ConvertedMarket
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConvertedMarketImplCopyWith<_$ConvertedMarketImpl> get copyWith =>
      __$$ConvertedMarketImplCopyWithImpl<_$ConvertedMarketImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConvertedMarketImplToJson(
      this,
    );
  }
}

abstract class _ConvertedMarket implements ConvertedMarket {
  factory _ConvertedMarket(
      {final double? btc,
      final double? eth,
      final double? usd}) = _$ConvertedMarketImpl;

  factory _ConvertedMarket.fromJson(Map<String, dynamic> json) =
      _$ConvertedMarketImpl.fromJson;

  @override
  double? get btc;
  @override
  double? get eth;
  @override
  double? get usd;

  /// Create a copy of ConvertedMarket
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConvertedMarketImplCopyWith<_$ConvertedMarketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
