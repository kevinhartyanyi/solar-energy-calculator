part of 'analyze_cubit.dart';

@freezed
abstract class AnalyzeState with _$AnalyzeState {
  const factory AnalyzeState.initial(
      {SolarData solarData,
      @Default(1) int amount,
      DateTime instalment,
      DateTime end,
      @Default(1) double electricityPrice,
      @Default(100) double panelCost,
      double totalEnergy}) = _Initial;
}
