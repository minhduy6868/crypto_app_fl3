// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'roi_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RoiModel _$RoiModelFromJson(Map<String, dynamic> json) {
  return _RoiModel.fromJson(json);
}

/// @nodoc
mixin _$RoiModel {
  double get times => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  double get percentage => throw _privateConstructorUsedError;

  /// Serializes this RoiModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RoiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RoiModelCopyWith<RoiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoiModelCopyWith<$Res> {
  factory $RoiModelCopyWith(RoiModel value, $Res Function(RoiModel) then) =
      _$RoiModelCopyWithImpl<$Res, RoiModel>;
  @useResult
  $Res call({double times, String currency, double percentage});
}

/// @nodoc
class _$RoiModelCopyWithImpl<$Res, $Val extends RoiModel>
    implements $RoiModelCopyWith<$Res> {
  _$RoiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RoiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? times = null,
    Object? currency = null,
    Object? percentage = null,
  }) {
    return _then(_value.copyWith(
      times: null == times
          ? _value.times
          : times // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoiModelImplCopyWith<$Res>
    implements $RoiModelCopyWith<$Res> {
  factory _$$RoiModelImplCopyWith(
          _$RoiModelImpl value, $Res Function(_$RoiModelImpl) then) =
      __$$RoiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double times, String currency, double percentage});
}

/// @nodoc
class __$$RoiModelImplCopyWithImpl<$Res>
    extends _$RoiModelCopyWithImpl<$Res, _$RoiModelImpl>
    implements _$$RoiModelImplCopyWith<$Res> {
  __$$RoiModelImplCopyWithImpl(
      _$RoiModelImpl _value, $Res Function(_$RoiModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RoiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? times = null,
    Object? currency = null,
    Object? percentage = null,
  }) {
    return _then(_$RoiModelImpl(
      times: null == times
          ? _value.times
          : times // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoiModelImpl implements _RoiModel {
  _$RoiModelImpl(
      {required this.times, required this.currency, required this.percentage});

  factory _$RoiModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoiModelImplFromJson(json);

  @override
  final double times;
  @override
  final String currency;
  @override
  final double percentage;

  @override
  String toString() {
    return 'RoiModel(times: $times, currency: $currency, percentage: $percentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoiModelImpl &&
            (identical(other.times, times) || other.times == times) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, times, currency, percentage);

  /// Create a copy of RoiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoiModelImplCopyWith<_$RoiModelImpl> get copyWith =>
      __$$RoiModelImplCopyWithImpl<_$RoiModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoiModelImplToJson(
      this,
    );
  }
}

abstract class _RoiModel implements RoiModel {
  factory _RoiModel(
      {required final double times,
      required final String currency,
      required final double percentage}) = _$RoiModelImpl;

  factory _RoiModel.fromJson(Map<String, dynamic> json) =
      _$RoiModelImpl.fromJson;

  @override
  double get times;
  @override
  String get currency;
  @override
  double get percentage;

  /// Create a copy of RoiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoiModelImplCopyWith<_$RoiModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
