import 'package:green_energy/analyze/cubit/analyze_cubit.dart';
import 'package:green_energy/models/solar_data.dart';
import 'package:hive/hive.dart';

part 'calculation_box.g.dart';

@HiveType(typeId: 0)
class CalculationBox extends HiveObject {
  @HiveField(0)
  final SolarData solarData;
  @HiveField(1)
  final int solarPanelAmount;
  @HiveField(2)
  final DateTime instalment;
  @HiveField(3)
  final DateTime end;
  @HiveField(4)
  final double electricityPrice;
  @HiveField(5)
  final double costs;
  @HiveField(6)
  final String name;

  CalculationBox(this.solarData, this.solarPanelAmount, this.instalment,
      this.end, this.electricityPrice, this.costs, this.name);

  factory CalculationBox.fromAnalyzeState(AnalyzeState state) {
    return CalculationBox(state.solarData, state.amount, state.instalment,
        state.end, state.electricityPrice, state.costs, state.name);
  }
}
