// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sparkline_in_7d_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SparklineIn7dModel _$SparklineIn7dModelFromJson(Map<String, dynamic> json) {
  return _SparklineIn7dModel.fromJson(json);
}

/// @nodoc
mixin _$SparklineIn7dModel {
  List<double> get price => throw _privateConstructorUsedError;

  /// Serializes this SparklineIn7dModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SparklineIn7dModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SparklineIn7dModelCopyWith<SparklineIn7dModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SparklineIn7dModelCopyWith<$Res> {
  factory $SparklineIn7dModelCopyWith(
          SparklineIn7dModel value, $Res Function(SparklineIn7dModel) then) =
      _$SparklineIn7dModelCopyWithImpl<$Res, SparklineIn7dModel>;
  @useResult
  $Res call({List<double> price});
}

/// @nodoc
class _$SparklineIn7dModelCopyWithImpl<$Res, $Val extends SparklineIn7dModel>
    implements $SparklineIn7dModelCopyWith<$Res> {
  _$SparklineIn7dModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SparklineIn7dModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SparklineIn7dModelImplCopyWith<$Res>
    implements $SparklineIn7dModelCopyWith<$Res> {
  factory _$$SparklineIn7dModelImplCopyWith(_$SparklineIn7dModelImpl value,
          $Res Function(_$SparklineIn7dModelImpl) then) =
      __$$SparklineIn7dModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<double> price});
}

/// @nodoc
class __$$SparklineIn7dModelImplCopyWithImpl<$Res>
    extends _$SparklineIn7dModelCopyWithImpl<$Res, _$SparklineIn7dModelImpl>
    implements _$$SparklineIn7dModelImplCopyWith<$Res> {
  __$$SparklineIn7dModelImplCopyWithImpl(_$SparklineIn7dModelImpl _value,
      $Res Function(_$SparklineIn7dModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SparklineIn7dModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
  }) {
    return _then(_$SparklineIn7dModelImpl(
      price: null == price
          ? _value._price
          : price // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SparklineIn7dModelImpl implements _SparklineIn7dModel {
  _$SparklineIn7dModelImpl({required final List<double> price})
      : _price = price;

  factory _$SparklineIn7dModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SparklineIn7dModelImplFromJson(json);

  final List<double> _price;
  @override
  List<double> get price {
    if (_price is EqualUnmodifiableListView) return _price;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_price);
  }

  @override
  String toString() {
    return 'SparklineIn7dModel(price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SparklineIn7dModelImpl &&
            const DeepCollectionEquality().equals(other._price, _price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_price));

  /// Create a copy of SparklineIn7dModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SparklineIn7dModelImplCopyWith<_$SparklineIn7dModelImpl> get copyWith =>
      __$$SparklineIn7dModelImplCopyWithImpl<_$SparklineIn7dModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SparklineIn7dModelImplToJson(
      this,
    );
  }
}

abstract class _SparklineIn7dModel implements SparklineIn7dModel {
  factory _SparklineIn7dModel({required final List<double> price}) =
      _$SparklineIn7dModelImpl;

  factory _SparklineIn7dModel.fromJson(Map<String, dynamic> json) =
      _$SparklineIn7dModelImpl.fromJson;

  @override
  List<double> get price;

  /// Create a copy of SparklineIn7dModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SparklineIn7dModelImplCopyWith<_$SparklineIn7dModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
