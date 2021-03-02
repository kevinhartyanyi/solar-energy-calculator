part of 'calculator_cubit.dart';

@freezed
abstract class CalculatorState with _$CalculatorState {
  const factory CalculatorState.initial({
    double latitude,
    double longitude,
    @Default(1000) double peakpower,
    @Default(14) double loss,
    String errorMessage,
    @Default(FormzStatus.pure) FormzStatus status,
    SolarData solarData,
  }) = _Initial;
}
