part of 'analyze_cubit.dart';

@freezed
abstract class AnalyzeState with _$AnalyzeState {
  const factory AnalyzeState.initial(
      {SolarData solarData,
      @Default(1) int amount,
      DateTime instalment,
      @Default(1) double electricityPrice,
      @Default(100) double panelCost}) = _Initial;
}
