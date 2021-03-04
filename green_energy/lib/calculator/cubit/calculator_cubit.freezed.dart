// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'calculator_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$CalculatorStateTearOff {
  const _$CalculatorStateTearOff();

// ignore: unused_element
  _Initial initial(
      {Coordinate latitude,
      Coordinate longitude,
      double peakpower = 1000,
      double loss = 14,
      String errorMessage,
      FormzStatus status = FormzStatus.pure,
      SolarData solarData}) {
    return _Initial(
      latitude: latitude,
      longitude: longitude,
      peakpower: peakpower,
      loss: loss,
      errorMessage: errorMessage,
      status: status,
      solarData: solarData,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $CalculatorState = _$CalculatorStateTearOff();

/// @nodoc
mixin _$CalculatorState {
  Coordinate get latitude;
  Coordinate get longitude;
  double get peakpower;
  double get loss;
  String get errorMessage;
  FormzStatus get status;
  SolarData get solarData;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult initial(
            Coordinate latitude,
            Coordinate longitude,
            double peakpower,
            double loss,
            String errorMessage,
            FormzStatus status,
            SolarData solarData),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(
        Coordinate latitude,
        Coordinate longitude,
        double peakpower,
        double loss,
        String errorMessage,
        FormzStatus status,
        SolarData solarData),
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
  $CalculatorStateCopyWith<CalculatorState> get copyWith;
}

/// @nodoc
abstract class $CalculatorStateCopyWith<$Res> {
  factory $CalculatorStateCopyWith(
          CalculatorState value, $Res Function(CalculatorState) then) =
      _$CalculatorStateCopyWithImpl<$Res>;
  $Res call(
      {Coordinate latitude,
      Coordinate longitude,
      double peakpower,
      double loss,
      String errorMessage,
      FormzStatus status,
      SolarData solarData});
}

/// @nodoc
class _$CalculatorStateCopyWithImpl<$Res>
    implements $CalculatorStateCopyWith<$Res> {
  _$CalculatorStateCopyWithImpl(this._value, this._then);

  final CalculatorState _value;
  // ignore: unused_field
  final $Res Function(CalculatorState) _then;

  @override
  $Res call({
    Object latitude = freezed,
    Object longitude = freezed,
    Object peakpower = freezed,
    Object loss = freezed,
    Object errorMessage = freezed,
    Object status = freezed,
    Object solarData = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: latitude == freezed ? _value.latitude : latitude as Coordinate,
      longitude:
          longitude == freezed ? _value.longitude : longitude as Coordinate,
      peakpower: peakpower == freezed ? _value.peakpower : peakpower as double,
      loss: loss == freezed ? _value.loss : loss as double,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage as String,
      status: status == freezed ? _value.status : status as FormzStatus,
      solarData:
          solarData == freezed ? _value.solarData : solarData as SolarData,
    ));
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res>
    implements $CalculatorStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call(
      {Coordinate latitude,
      Coordinate longitude,
      double peakpower,
      double loss,
      String errorMessage,
      FormzStatus status,
      SolarData solarData});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$CalculatorStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object latitude = freezed,
    Object longitude = freezed,
    Object peakpower = freezed,
    Object loss = freezed,
    Object errorMessage = freezed,
    Object status = freezed,
    Object solarData = freezed,
  }) {
    return _then(_Initial(
      latitude: latitude == freezed ? _value.latitude : latitude as Coordinate,
      longitude:
          longitude == freezed ? _value.longitude : longitude as Coordinate,
      peakpower: peakpower == freezed ? _value.peakpower : peakpower as double,
      loss: loss == freezed ? _value.loss : loss as double,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage as String,
      status: status == freezed ? _value.status : status as FormzStatus,
      solarData:
          solarData == freezed ? _value.solarData : solarData as SolarData,
    ));
  }
}

/// @nodoc
class _$_Initial implements _Initial {
  const _$_Initial(
      {this.latitude,
      this.longitude,
      this.peakpower = 1000,
      this.loss = 14,
      this.errorMessage,
      this.status = FormzStatus.pure,
      this.solarData})
      : assert(peakpower != null),
        assert(loss != null),
        assert(status != null);

  @override
  final Coordinate latitude;
  @override
  final Coordinate longitude;
  @JsonKey(defaultValue: 1000)
  @override
  final double peakpower;
  @JsonKey(defaultValue: 14)
  @override
  final double loss;
  @override
  final String errorMessage;
  @JsonKey(defaultValue: FormzStatus.pure)
  @override
  final FormzStatus status;
  @override
  final SolarData solarData;

  @override
  String toString() {
    return 'CalculatorState.initial(latitude: $latitude, longitude: $longitude, peakpower: $peakpower, loss: $loss, errorMessage: $errorMessage, status: $status, solarData: $solarData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initial &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)) &&
            (identical(other.peakpower, peakpower) ||
                const DeepCollectionEquality()
                    .equals(other.peakpower, peakpower)) &&
            (identical(other.loss, loss) ||
                const DeepCollectionEquality().equals(other.loss, loss)) &&
            (identical(other.errorMessage, errorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessage, errorMessage)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.solarData, solarData) ||
                const DeepCollectionEquality()
                    .equals(other.solarData, solarData)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude) ^
      const DeepCollectionEquality().hash(peakpower) ^
      const DeepCollectionEquality().hash(loss) ^
      const DeepCollectionEquality().hash(errorMessage) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(solarData);

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult initial(
            Coordinate latitude,
            Coordinate longitude,
            double peakpower,
            double loss,
            String errorMessage,
            FormzStatus status,
            SolarData solarData),
  }) {
    assert(initial != null);
    return initial(
        latitude, longitude, peakpower, loss, errorMessage, status, solarData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(
        Coordinate latitude,
        Coordinate longitude,
        double peakpower,
        double loss,
        String errorMessage,
        FormzStatus status,
        SolarData solarData),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(latitude, longitude, peakpower, loss, errorMessage, status,
          solarData);
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

abstract class _Initial implements CalculatorState {
  const factory _Initial(
      {Coordinate latitude,
      Coordinate longitude,
      double peakpower,
      double loss,
      String errorMessage,
      FormzStatus status,
      SolarData solarData}) = _$_Initial;

  @override
  Coordinate get latitude;
  @override
  Coordinate get longitude;
  @override
  double get peakpower;
  @override
  double get loss;
  @override
  String get errorMessage;
  @override
  FormzStatus get status;
  @override
  SolarData get solarData;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith;
}
