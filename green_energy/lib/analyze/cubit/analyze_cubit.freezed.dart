// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'analyze_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AnalyzeStateTearOff {
  const _$AnalyzeStateTearOff();

// ignore: unused_element
  _Initial initial(
      {SolarData solarData,
      int amount = 1,
      DateTime instalment,
      double electricityPrice = 1,
      double panelCost = 100}) {
    return _Initial(
      solarData: solarData,
      amount: amount,
      instalment: instalment,
      electricityPrice: electricityPrice,
      panelCost: panelCost,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AnalyzeState = _$AnalyzeStateTearOff();

/// @nodoc
mixin _$AnalyzeState {
  SolarData get solarData;
  int get amount;
  DateTime get instalment;
  double get electricityPrice;
  double get panelCost;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult initial(SolarData solarData, int amount, DateTime instalment,
            double electricityPrice, double panelCost),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(SolarData solarData, int amount, DateTime instalment,
        double electricityPrice, double panelCost),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    @required TResult orElse(),
  });

  @JsonKey(ignore: true)
  $AnalyzeStateCopyWith<AnalyzeState> get copyWith;
}

/// @nodoc
abstract class $AnalyzeStateCopyWith<$Res> {
  factory $AnalyzeStateCopyWith(
          AnalyzeState value, $Res Function(AnalyzeState) then) =
      _$AnalyzeStateCopyWithImpl<$Res>;
  $Res call(
      {SolarData solarData,
      int amount,
      DateTime instalment,
      double electricityPrice,
      double panelCost});
}

/// @nodoc
class _$AnalyzeStateCopyWithImpl<$Res> implements $AnalyzeStateCopyWith<$Res> {
  _$AnalyzeStateCopyWithImpl(this._value, this._then);

  final AnalyzeState _value;
  // ignore: unused_field
  final $Res Function(AnalyzeState) _then;

  @override
  $Res call({
    Object solarData = freezed,
    Object amount = freezed,
    Object instalment = freezed,
    Object electricityPrice = freezed,
    Object panelCost = freezed,
  }) {
    return _then(_value.copyWith(
      solarData:
          solarData == freezed ? _value.solarData : solarData as SolarData,
      amount: amount == freezed ? _value.amount : amount as int,
      instalment:
          instalment == freezed ? _value.instalment : instalment as DateTime,
      electricityPrice: electricityPrice == freezed
          ? _value.electricityPrice
          : electricityPrice as double,
      panelCost: panelCost == freezed ? _value.panelCost : panelCost as double,
    ));
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> implements $AnalyzeStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call(
      {SolarData solarData,
      int amount,
      DateTime instalment,
      double electricityPrice,
      double panelCost});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$AnalyzeStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object solarData = freezed,
    Object amount = freezed,
    Object instalment = freezed,
    Object electricityPrice = freezed,
    Object panelCost = freezed,
  }) {
    return _then(_Initial(
      solarData:
          solarData == freezed ? _value.solarData : solarData as SolarData,
      amount: amount == freezed ? _value.amount : amount as int,
      instalment:
          instalment == freezed ? _value.instalment : instalment as DateTime,
      electricityPrice: electricityPrice == freezed
          ? _value.electricityPrice
          : electricityPrice as double,
      panelCost: panelCost == freezed ? _value.panelCost : panelCost as double,
    ));
  }
}

/// @nodoc
class _$_Initial implements _Initial {
  const _$_Initial(
      {this.solarData,
      this.amount = 1,
      this.instalment,
      this.electricityPrice = 1,
      this.panelCost = 100})
      : assert(amount != null),
        assert(electricityPrice != null),
        assert(panelCost != null);

  @override
  final SolarData solarData;
  @JsonKey(defaultValue: 1)
  @override
  final int amount;
  @override
  final DateTime instalment;
  @JsonKey(defaultValue: 1)
  @override
  final double electricityPrice;
  @JsonKey(defaultValue: 100)
  @override
  final double panelCost;

  @override
  String toString() {
    return 'AnalyzeState.initial(solarData: $solarData, amount: $amount, instalment: $instalment, electricityPrice: $electricityPrice, panelCost: $panelCost)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initial &&
            (identical(other.solarData, solarData) ||
                const DeepCollectionEquality()
                    .equals(other.solarData, solarData)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.instalment, instalment) ||
                const DeepCollectionEquality()
                    .equals(other.instalment, instalment)) &&
            (identical(other.electricityPrice, electricityPrice) ||
                const DeepCollectionEquality()
                    .equals(other.electricityPrice, electricityPrice)) &&
            (identical(other.panelCost, panelCost) ||
                const DeepCollectionEquality()
                    .equals(other.panelCost, panelCost)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(solarData) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(instalment) ^
      const DeepCollectionEquality().hash(electricityPrice) ^
      const DeepCollectionEquality().hash(panelCost);

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult initial(SolarData solarData, int amount, DateTime instalment,
            double electricityPrice, double panelCost),
  }) {
    assert(initial != null);
    return initial(solarData, amount, instalment, electricityPrice, panelCost);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(SolarData solarData, int amount, DateTime instalment,
        double electricityPrice, double panelCost),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(
          solarData, amount, instalment, electricityPrice, panelCost);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
  }) {
    assert(initial != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AnalyzeState {
  const factory _Initial(
      {SolarData solarData,
      int amount,
      DateTime instalment,
      double electricityPrice,
      double panelCost}) = _$_Initial;

  @override
  SolarData get solarData;
  @override
  int get amount;
  @override
  DateTime get instalment;
  @override
  double get electricityPrice;
  @override
  double get panelCost;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith;
}
