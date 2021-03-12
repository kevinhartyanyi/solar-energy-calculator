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
      DateTime end,
      double electricityPrice = 1,
      double panelCost = 100,
      double totalEnergy,
      String barChartText,
      String areaChartText}) {
    return _Initial(
      solarData: solarData,
      amount: amount,
      instalment: instalment,
      end: end,
      electricityPrice: electricityPrice,
      panelCost: panelCost,
      totalEnergy: totalEnergy,
      barChartText: barChartText,
      areaChartText: areaChartText,
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
  DateTime get end;
  double get electricityPrice;
  double get panelCost;
  double get totalEnergy;
  String get barChartText;
  String get areaChartText;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult initial(
            SolarData solarData,
            int amount,
            DateTime instalment,
            DateTime end,
            double electricityPrice,
            double panelCost,
            double totalEnergy,
            String barChartText,
            String areaChartText),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(
        SolarData solarData,
        int amount,
        DateTime instalment,
        DateTime end,
        double electricityPrice,
        double panelCost,
        double totalEnergy,
        String barChartText,
        String areaChartText),
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
      DateTime end,
      double electricityPrice,
      double panelCost,
      double totalEnergy,
      String barChartText,
      String areaChartText});
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
    Object end = freezed,
    Object electricityPrice = freezed,
    Object panelCost = freezed,
    Object totalEnergy = freezed,
    Object barChartText = freezed,
    Object areaChartText = freezed,
  }) {
    return _then(_value.copyWith(
      solarData:
          solarData == freezed ? _value.solarData : solarData as SolarData,
      amount: amount == freezed ? _value.amount : amount as int,
      instalment:
          instalment == freezed ? _value.instalment : instalment as DateTime,
      end: end == freezed ? _value.end : end as DateTime,
      electricityPrice: electricityPrice == freezed
          ? _value.electricityPrice
          : electricityPrice as double,
      panelCost: panelCost == freezed ? _value.panelCost : panelCost as double,
      totalEnergy:
          totalEnergy == freezed ? _value.totalEnergy : totalEnergy as double,
      barChartText: barChartText == freezed
          ? _value.barChartText
          : barChartText as String,
      areaChartText: areaChartText == freezed
          ? _value.areaChartText
          : areaChartText as String,
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
      DateTime end,
      double electricityPrice,
      double panelCost,
      double totalEnergy,
      String barChartText,
      String areaChartText});
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
    Object end = freezed,
    Object electricityPrice = freezed,
    Object panelCost = freezed,
    Object totalEnergy = freezed,
    Object barChartText = freezed,
    Object areaChartText = freezed,
  }) {
    return _then(_Initial(
      solarData:
          solarData == freezed ? _value.solarData : solarData as SolarData,
      amount: amount == freezed ? _value.amount : amount as int,
      instalment:
          instalment == freezed ? _value.instalment : instalment as DateTime,
      end: end == freezed ? _value.end : end as DateTime,
      electricityPrice: electricityPrice == freezed
          ? _value.electricityPrice
          : electricityPrice as double,
      panelCost: panelCost == freezed ? _value.panelCost : panelCost as double,
      totalEnergy:
          totalEnergy == freezed ? _value.totalEnergy : totalEnergy as double,
      barChartText: barChartText == freezed
          ? _value.barChartText
          : barChartText as String,
      areaChartText: areaChartText == freezed
          ? _value.areaChartText
          : areaChartText as String,
    ));
  }
}

/// @nodoc
class _$_Initial implements _Initial {
  const _$_Initial(
      {this.solarData,
      this.amount = 1,
      this.instalment,
      this.end,
      this.electricityPrice = 1,
      this.panelCost = 100,
      this.totalEnergy,
      this.barChartText,
      this.areaChartText})
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
  @override
  final DateTime end;
  @JsonKey(defaultValue: 1)
  @override
  final double electricityPrice;
  @JsonKey(defaultValue: 100)
  @override
  final double panelCost;
  @override
  final double totalEnergy;
  @override
  final String barChartText;
  @override
  final String areaChartText;

  @override
  String toString() {
    return 'AnalyzeState.initial(solarData: $solarData, amount: $amount, instalment: $instalment, end: $end, electricityPrice: $electricityPrice, panelCost: $panelCost, totalEnergy: $totalEnergy, barChartText: $barChartText, areaChartText: $areaChartText)';
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
            (identical(other.end, end) ||
                const DeepCollectionEquality().equals(other.end, end)) &&
            (identical(other.electricityPrice, electricityPrice) ||
                const DeepCollectionEquality()
                    .equals(other.electricityPrice, electricityPrice)) &&
            (identical(other.panelCost, panelCost) ||
                const DeepCollectionEquality()
                    .equals(other.panelCost, panelCost)) &&
            (identical(other.totalEnergy, totalEnergy) ||
                const DeepCollectionEquality()
                    .equals(other.totalEnergy, totalEnergy)) &&
            (identical(other.barChartText, barChartText) ||
                const DeepCollectionEquality()
                    .equals(other.barChartText, barChartText)) &&
            (identical(other.areaChartText, areaChartText) ||
                const DeepCollectionEquality()
                    .equals(other.areaChartText, areaChartText)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(solarData) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(instalment) ^
      const DeepCollectionEquality().hash(end) ^
      const DeepCollectionEquality().hash(electricityPrice) ^
      const DeepCollectionEquality().hash(panelCost) ^
      const DeepCollectionEquality().hash(totalEnergy) ^
      const DeepCollectionEquality().hash(barChartText) ^
      const DeepCollectionEquality().hash(areaChartText);

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult initial(
            SolarData solarData,
            int amount,
            DateTime instalment,
            DateTime end,
            double electricityPrice,
            double panelCost,
            double totalEnergy,
            String barChartText,
            String areaChartText),
  }) {
    assert(initial != null);
    return initial(solarData, amount, instalment, end, electricityPrice,
        panelCost, totalEnergy, barChartText, areaChartText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(
        SolarData solarData,
        int amount,
        DateTime instalment,
        DateTime end,
        double electricityPrice,
        double panelCost,
        double totalEnergy,
        String barChartText,
        String areaChartText),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(solarData, amount, instalment, end, electricityPrice,
          panelCost, totalEnergy, barChartText, areaChartText);
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
      DateTime end,
      double electricityPrice,
      double panelCost,
      double totalEnergy,
      String barChartText,
      String areaChartText}) = _$_Initial;

  @override
  SolarData get solarData;
  @override
  int get amount;
  @override
  DateTime get instalment;
  @override
  DateTime get end;
  @override
  double get electricityPrice;
  @override
  double get panelCost;
  @override
  double get totalEnergy;
  @override
  String get barChartText;
  @override
  String get areaChartText;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith;
}
