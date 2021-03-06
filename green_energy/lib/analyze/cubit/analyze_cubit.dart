import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:green_energy/models/solar_data.dart';

part 'analyze_state.dart';
part 'analyze_cubit.freezed.dart';

class AnalyzeCubit extends Cubit<AnalyzeState> {
  AnalyzeCubit(SolarData solarData)
      : super(AnalyzeState.initial(
            solarData: solarData, instalment: DateTime.now()));

  void changeAmount(int amount) {
    emit(state.copyWith(amount: amount));
  }

  void changeInstalment(DateTime instalment) {
    emit(state.copyWith(instalment: instalment));
  }

  void changeElectricityPricePrice(double price) {
    emit(state.copyWith(electricityPrice: price));
  }

  void changePanelCost(double cost) {
    emit(state.copyWith(panelCost: cost));
  }
}
