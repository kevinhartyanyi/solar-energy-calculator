import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:green_energy/constans.dart';
import 'package:green_energy/models/sequence_item.dart';
import 'package:green_energy/models/solar_data.dart';
import 'package:green_energy/models/sum_item.dart';
import 'package:green_energy/utils.dart';
import 'package:jiffy/jiffy.dart';
import 'package:logging/logging.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';

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

  void changeBarChartText(charts.SelectionModel model) {
    final selected = model.selectedDatum.first.datum as SumItem;
    final text = "${selected.name}: ${selected.amount} kWh";
    _log.fine("change barChartText to $text");
    emit(state.copyWith(barChartText: text));
  }

  void changeAreaChartText(charts.SelectionModel model, Locale myLocale) {
    final selected = model.selectedDatum.first.datum as SequenceItem;
    final date = DateFormat.yMd(myLocale.languageCode).format(selected.date);
    final text = "$date: ${selected.value}";
    _log.fine("change areaChartText to $text");
    emit(state.copyWith(areaChartText: text));
  }

  List<charts.Series<SequenceItem, DateTime>> getSequenceTimes(
      String id, ThemeData theme) {
    List<SequenceItem> dailyEnergy(DateTime start, double energy, int days,
        {double baseEnergy = 0, bool countFirst = false}) {
      final List<SequenceItem> re = [];
      final avgDailyEnergy = energy / days;
      double energySum = countFirst ? avgDailyEnergy : 0;
      for (var i = 0; i < days; i++) {
        re.add(
          SequenceItem(DateTime(start.year, start.month, start.day + i),
              getMoneySaved(energySum + baseEnergy, state.electricityPrice)),
        );
        energySum += avgDailyEnergy;
      }
      return re;
    }

    final List<SequenceItem> energyData = [];
    if (state.instalment.year == state.end.year &&
        state.instalment.month == state.end.month) {
      final days = state.end.day - state.instalment.day;
      final avgDailyEnergy =
          state.solarData.avgMonthlyEnergy[state.instalment.month - 1];
      //final startDate = state.instalment;
      energyData
          .addAll(dailyEnergy(state.instalment, avgDailyEnergy, days + 1));
    } else {
      final energyParts = getTotalEnergyProducedParts(
          state.solarData, state.instalment, state.end);
      final diffMonths = Jiffy(DateTime(state.end.year, state.end.month)).diff(
          DateTime(state.instalment.year, state.instalment.month),
          Units.MONTH) as int;

      // Add energy generated in start month
      final lastdayFromStartMonth =
          DateTime(state.instalment.year, state.instalment.month + 1, 0).day;
      final daysFromStartMonth =
          (lastdayFromStartMonth - state.instalment.day) +
              1; // +1 to take into account the day it was installed on
      energyData.addAll(
          dailyEnergy(state.instalment, energyParts.item1, daysFromStartMonth));

      // Add energy generated through months
      final startDate = state.instalment;
      double baseEnergy = energyParts.item1;
      for (var i = 0; i < diffMonths - 1; i++) {
        final month = ((state.instalment.month + i) % 12) + 1;
        final avgMonthly = state.solarData.avgMonthlyEnergy[month - 1];
        final currentDate = DateTime(startDate.year, startDate.month + i + 1);
        final daysInMonth =
            DateTime(currentDate.year, currentDate.month + 1, 0).day;
        energyData.addAll(dailyEnergy(currentDate, avgMonthly, daysInMonth,
            baseEnergy: baseEnergy, countFirst: true));
        baseEnergy = energyData.last.value;
      }

      // Add energy generated in last month
      //final avgDailyLastMonth = energyParts.item3 / state.end.day;
      final endBeginMonth = DateTime(state.end.year, state.end.month);
      energyData.addAll(dailyEnergy(
          endBeginMonth, energyParts.item3, state.end.day,
          baseEnergy: energyData.last.value, countFirst: true));
    }
    for (var item in energyData) {
      print(item);
    }

    _log.finest("getSequenceTimes");

    return [
      charts.Series<SequenceItem, DateTime>(
        id: id,
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(theme.accentColor),
        domainFn: (SequenceItem sumTime, _) => sumTime.date,
        measureFn: (SequenceItem sumTime, _) => sumTime.value,
        data: energyData,
      )
    ];
  }

  List<charts.Series<SumItem, String>> getSumTimes(
      final String id, ThemeData theme) {
    final List<SumItem> sumItems = [];
    for (var i = 0; i < 12; i++) {
      sumItems.add(SumItem(
          monthToString(months[i]), state.solarData.avgMonthlyEnergy[i]));
    }

    _log.finest("getSumTimes");

    return [
      charts.Series<SumItem, String>(
        id: id,
        colorFn: (_, ind) => charts.ColorUtil.fromDartColor(theme.accentColor),
        domainFn: (SumItem item, _) => item.name,
        measureFn: (SumItem item, _) => item.amount,
        data: sumItems,
      )
    ];
  }
}
