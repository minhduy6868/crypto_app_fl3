// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_coin_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DetailCoinScreenState {
  String? get errorMessage => throw _privateConstructorUsedError;
  ScreenValue? get status => throw _privateConstructorUsedError;
  CoinMarket? get coins => throw _privateConstructorUsedError;
  List<Chart>? get chartData => throw _privateConstructorUsedError;
  bool? get isLoadingAI => throw _privateConstructorUsedError;
  String? get aiPrediction => throw _privateConstructorUsedError;
  int get selectedDays =>
      throw _privateConstructorUsedError; // Thêm trường selectedDays
  bool get isDescriptionExpanded => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? errorMessage,
            ScreenValue? status,
            CoinMarket? coins,
            List<Chart>? chartData,
            bool? isLoadingAI,
            String? aiPrediction,
            int selectedDays,
            bool isDescriptionExpanded)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? errorMessage,
            ScreenValue? status,
            CoinMarket? coins,
            List<Chart>? chartData,
            bool? isLoadingAI,
            String? aiPrediction,
            int selectedDays,
            bool isDescriptionExpanded)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? errorMessage,
            ScreenValue? status,
            CoinMarket? coins,
            List<Chart>? chartData,
            bool? isLoadingAI,
            String? aiPrediction,
            int selectedDays,
            bool isDescriptionExpanded)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of DetailCoinScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailCoinScreenStateCopyWith<DetailCoinScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailCoinScreenStateCopyWith<$Res> {
  factory $DetailCoinScreenStateCopyWith(DetailCoinScreenState value,
          $Res Function(DetailCoinScreenState) then) =
      _$DetailCoinScreenStateCopyWithImpl<$Res, DetailCoinScreenState>;
  @useResult
  $Res call(
      {String? errorMessage,
      ScreenValue? status,
      CoinMarket? coins,
      List<Chart>? chartData,
      bool? isLoadingAI,
      String? aiPrediction,
      int selectedDays,
      bool isDescriptionExpanded});

  $CoinMarketCopyWith<$Res>? get coins;
}

/// @nodoc
class _$DetailCoinScreenStateCopyWithImpl<$Res,
        $Val extends DetailCoinScreenState>
    implements $DetailCoinScreenStateCopyWith<$Res> {
  _$DetailCoinScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailCoinScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? status = freezed,
    Object? coins = freezed,
    Object? chartData = freezed,
    Object? isLoadingAI = freezed,
    Object? aiPrediction = freezed,
    Object? selectedDays = null,
    Object? isDescriptionExpanded = null,
  }) {
    return _then(_value.copyWith(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ScreenValue?,
      coins: freezed == coins
          ? _value.coins
          : coins // ignore: cast_nullable_to_non_nullable
              as CoinMarket?,
      chartData: freezed == chartData
          ? _value.chartData
          : chartData // ignore: cast_nullable_to_non_nullable
              as List<Chart>?,
      isLoadingAI: freezed == isLoadingAI
          ? _value.isLoadingAI
          : isLoadingAI // ignore: cast_nullable_to_non_nullable
              as bool?,
      aiPrediction: freezed == aiPrediction
          ? _value.aiPrediction
          : aiPrediction // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedDays: null == selectedDays
          ? _value.selectedDays
          : selectedDays // ignore: cast_nullable_to_non_nullable
              as int,
      isDescriptionExpanded: null == isDescriptionExpanded
          ? _value.isDescriptionExpanded
          : isDescriptionExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of DetailCoinScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CoinMarketCopyWith<$Res>? get coins {
    if (_value.coins == null) {
      return null;
    }

    return $CoinMarketCopyWith<$Res>(_value.coins!, (value) {
      return _then(_value.copyWith(coins: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $DetailCoinScreenStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? errorMessage,
      ScreenValue? status,
      CoinMarket? coins,
      List<Chart>? chartData,
      bool? isLoadingAI,
      String? aiPrediction,
      int selectedDays,
      bool isDescriptionExpanded});

  @override
  $CoinMarketCopyWith<$Res>? get coins;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$DetailCoinScreenStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetailCoinScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? status = freezed,
    Object? coins = freezed,
    Object? chartData = freezed,
    Object? isLoadingAI = freezed,
    Object? aiPrediction = freezed,
    Object? selectedDays = null,
    Object? isDescriptionExpanded = null,
  }) {
    return _then(_$InitialImpl(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ScreenValue?,
      coins: freezed == coins
          ? _value.coins
          : coins // ignore: cast_nullable_to_non_nullable
              as CoinMarket?,
      chartData: freezed == chartData
          ? _value._chartData
          : chartData // ignore: cast_nullable_to_non_nullable
              as List<Chart>?,
      isLoadingAI: freezed == isLoadingAI
          ? _value.isLoadingAI
          : isLoadingAI // ignore: cast_nullable_to_non_nullable
              as bool?,
      aiPrediction: freezed == aiPrediction
          ? _value.aiPrediction
          : aiPrediction // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedDays: null == selectedDays
          ? _value.selectedDays
          : selectedDays // ignore: cast_nullable_to_non_nullable
              as int,
      isDescriptionExpanded: null == isDescriptionExpanded
          ? _value.isDescriptionExpanded
          : isDescriptionExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.errorMessage,
      this.status,
      this.coins,
      final List<Chart>? chartData,
      this.isLoadingAI,
      this.aiPrediction,
      this.selectedDays = 1,
      this.isDescriptionExpanded = false})
      : _chartData = chartData;

  @override
  final String? errorMessage;
  @override
  final ScreenValue? status;
  @override
  final CoinMarket? coins;
  final List<Chart>? _chartData;
  @override
  List<Chart>? get chartData {
    final value = _chartData;
    if (value == null) return null;
    if (_chartData is EqualUnmodifiableListView) return _chartData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? isLoadingAI;
  @override
  final String? aiPrediction;
  @override
  @JsonKey()
  final int selectedDays;
// Thêm trường selectedDays
  @override
  @JsonKey()
  final bool isDescriptionExpanded;

  @override
  String toString() {
    return 'DetailCoinScreenState.initial(errorMessage: $errorMessage, status: $status, coins: $coins, chartData: $chartData, isLoadingAI: $isLoadingAI, aiPrediction: $aiPrediction, selectedDays: $selectedDays, isDescriptionExpanded: $isDescriptionExpanded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.coins, coins) || other.coins == coins) &&
            const DeepCollectionEquality()
                .equals(other._chartData, _chartData) &&
            (identical(other.isLoadingAI, isLoadingAI) ||
                other.isLoadingAI == isLoadingAI) &&
            (identical(other.aiPrediction, aiPrediction) ||
                other.aiPrediction == aiPrediction) &&
            (identical(other.selectedDays, selectedDays) ||
                other.selectedDays == selectedDays) &&
            (identical(other.isDescriptionExpanded, isDescriptionExpanded) ||
                other.isDescriptionExpanded == isDescriptionExpanded));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      errorMessage,
      status,
      coins,
      const DeepCollectionEquality().hash(_chartData),
      isLoadingAI,
      aiPrediction,
      selectedDays,
      isDescriptionExpanded);

  /// Create a copy of DetailCoinScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? errorMessage,
            ScreenValue? status,
            CoinMarket? coins,
            List<Chart>? chartData,
            bool? isLoadingAI,
            String? aiPrediction,
            int selectedDays,
            bool isDescriptionExpanded)
        initial,
  }) {
    return initial(errorMessage, status, coins, chartData, isLoadingAI,
        aiPrediction, selectedDays, isDescriptionExpanded);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? errorMessage,
            ScreenValue? status,
            CoinMarket? coins,
            List<Chart>? chartData,
            bool? isLoadingAI,
            String? aiPrediction,
            int selectedDays,
            bool isDescriptionExpanded)?
        initial,
  }) {
    return initial?.call(errorMessage, status, coins, chartData, isLoadingAI,
        aiPrediction, selectedDays, isDescriptionExpanded);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? errorMessage,
            ScreenValue? status,
            CoinMarket? coins,
            List<Chart>? chartData,
            bool? isLoadingAI,
            String? aiPrediction,
            int selectedDays,
            bool isDescriptionExpanded)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(errorMessage, status, coins, chartData, isLoadingAI,
          aiPrediction, selectedDays, isDescriptionExpanded);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements DetailCoinScreenState {
  const factory _Initial(
      {final String? errorMessage,
      final ScreenValue? status,
      final CoinMarket? coins,
      final List<Chart>? chartData,
      final bool? isLoadingAI,
      final String? aiPrediction,
      final int selectedDays,
      final bool isDescriptionExpanded}) = _$InitialImpl;

  @override
  String? get errorMessage;
  @override
  ScreenValue? get status;
  @override
  CoinMarket? get coins;
  @override
  List<Chart>? get chartData;
  @override
  bool? get isLoadingAI;
  @override
  String? get aiPrediction;
  @override
  int get selectedDays; // Thêm trường selectedDays
  @override
  bool get isDescriptionExpanded;

  /// Create a copy of DetailCoinScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
