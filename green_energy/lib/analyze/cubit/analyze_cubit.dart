import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:green_energy/models/solar_data.dart';
import 'package:green_energy/utils.dart';
import 'package:logging/logging.dart';

part 'analyze_state.dart';
part 'analyze_cubit.freezed.dart';

class AnalyzeCubit extends Cubit<AnalyzeState> {
  AnalyzeCubit(SolarData solarData)
      : super(AnalyzeState.initial(
            solarData: solarData,
            instalment: DateTime.now().subtract(const Duration(days: 365)),
            end: DateTime.now(),
            totalEnergy: getTotalEnergyProduced(
                solarData,
                DateTime.now().subtract(const Duration(days: 365)),
                DateTime.now())));

  static final _log = Logger("AnalyzeCubit");

  void changeAmount(int amount) {
    _log.fine("change amount to $amount");
    emit(state.copyWith(amount: amount));
  }

  void changeInstalment(DateTime instalment) {
    _log.fine("change instalment to $instalment");
    emit(state.copyWith(
        instalment: instalment,
        totalEnergy: getTotalEnergyProduced(state.solarData, instalment)));
  }

  void changeEndDate(DateTime end) {
    _log.fine("change end date to $end");
    emit(state.copyWith(
        end: end,
        totalEnergy:
            getTotalEnergyProduced(state.solarData, state.instalment, end)));
  }

  void changeElectricityPricePrice(double price) {
    _log.fine("change price to $price");
    emit(state.copyWith(electricityPrice: price));
  }

  void changePanelCost(double cost) {
    _log.fine("change cost to $cost");
    emit(state.copyWith(panelCost: cost));
  }
}
