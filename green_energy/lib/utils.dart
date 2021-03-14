import 'package:flutter/foundation.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:green_energy/common/my_alert_dialog.dart';
import 'package:green_energy/common/my_text.dart';
import 'package:green_energy/constans.dart';
import 'package:green_energy/models/solar_data.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:auto_route/auto_route.dart';
import 'package:tuple/tuple.dart';

Uri urlBuilder({
  @required double lat,
  @required double lon,
  @required double peakpower,
  @required double loss,
}) {
  return Uri.https("re.jrc.ec.europa.eu", "/api/PVcalc", {
    "lat": lat.toString(),
    "lon": lon.toString(),
    "peakpower": peakpower.toString(),
    "loss": loss.toString(),
    "outputformat": "json"
  });
}

dynamic _mockedConnectivity;

void setMockedConnectivityForUnitTesting(dynamic mockedConnectivity) {
  _mockedConnectivity = mockedConnectivity;
}

Future<bool> isOffline() async {
  if (_mockedConnectivity == null) {
    final ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    return connectivityResult == ConnectivityResult.none;
  } else {
    final connectivityResult = await _mockedConnectivity.checkConnectivity();
    return connectivityResult == ConnectivityResult.none;
  }
}

String roundAndRemoveTrailingZeros(final double n, [int keep = 2]) {
  final NumberFormat formatter = NumberFormat();
  formatter.minimumFractionDigits = 0;
  formatter.maximumFractionDigits = keep;
  return formatter.format(n);
}

Future<void> datePicker(
    {@required BuildContext context,
    @required Function(DateTime) onPicked,
    @required bool isLightTheme,
    DateTime initialDate,
    DateTime firstDate,
    DateTime lastDate}) async {
  final DateTime picked = await showDatePicker(
    context: context,
    initialDate: initialDate ?? DateTime.now(),
    firstDate: firstDate ?? DateTime(2000), // This might not work
    lastDate: lastDate ?? DateTime.now(),
    builder: (BuildContext context, Widget child) {
      return Theme(
        data: isLightTheme ? ThemeData.light() : ThemeData.dark(),
        child: child,
      );
    },
  );
  if (picked != null && picked != initialDate) {
    onPicked(picked);
  }
}

Tuple3<double, double, double> getTotalEnergyProducedParts(
    SolarData solarData, DateTime instalment,
    [DateTime endDate]) {
  final end = endDate ?? DateTime.now();

  print("Start $instalment, end: $end");

  double getEnergyForMonth(int month) {
    return solarData.avgMonthlyEnergy[month - 1];
  }

  double getAvgDailyEnergyForMonth(int month) {
    // TODO: Not perfectly accurate, because we use the instalment year
    final days = DateTime(instalment.year, month + 1, 0).day;
    return getEnergyForMonth(month) / days;
  }

  double getEnergyForMonths(int startMonth, int monthsAmount) {
    print("Months amount: $monthsAmount");
    double energySum = 0;
    for (var i = 0; i < monthsAmount - 1; i++) {
      final month = ((startMonth + i) % 12) + 1;
      energySum += getEnergyForMonth(month);
    }
    return energySum;
  }

  if (instalment.year == end.year && instalment.month == end.month) {
    // Same month case
    final days = end.day - instalment.day;
    return Tuple3(getAvgDailyEnergyForMonth(instalment.month) * days, 0, 0);
  }

  final lastdayFromStartMonth =
      DateTime(instalment.year, instalment.month + 1, 0).day;
  final daysFromStartMonth = (lastdayFromStartMonth - instalment.day) +
      1; // +1 to take into account the day it was installed on
  print(
      "Current day ${instalment.day}\n lastDay: $lastdayFromStartMonth,\n diff: $daysFromStartMonth");
  final diffMonths = Jiffy(end).diff(instalment, Units.MONTH) as int;
  print("Month diff: $diffMonths");

  final daysThisMonth = end.day;
  print("Days in this month: $daysThisMonth");
  final energyFromStartMonth =
      getAvgDailyEnergyForMonth(instalment.month) * daysFromStartMonth;
  final energyFromCurrentMonth = getAvgDailyEnergyForMonth(end.month) * end.day;
  final energyFromMonths = getEnergyForMonths(instalment.month, diffMonths);
  print("start month: $energyFromStartMonth");
  print("current month: $energyFromCurrentMonth");
  print("energy for months: $energyFromMonths");
  return Tuple3(energyFromStartMonth, energyFromMonths, energyFromCurrentMonth);
}

double getTotalEnergyProduced(SolarData solarData, DateTime instalment,
    [DateTime endDate]) {
  final parts = getTotalEnergyProducedParts(solarData, instalment, endDate);
  return parts.item1 + parts.item2 + parts.item3;
}

double getMoneySaved(double energy, double electricityPrice, int panels) {
  return energy * electricityPrice * panels;
}

double getCO2Reduction(double energy) {
  return energy * co2PerKwh;
}

String formatCO2Reduction(double co2Reduction) {
  if (co2Reduction >= 1000) {
    final co2Ton = roundAndRemoveTrailingZeros(co2Reduction / 1000);
    return "$co2Ton t";
  } else {
    final co2Kg = roundAndRemoveTrailingZeros(co2Reduction);
    return "$co2Kg kg";
  }
}

String formatTotalEnergy(double totalEnergy) {
  if (totalEnergy >= 1000) {
    final mwh = roundAndRemoveTrailingZeros(totalEnergy / 1000);
    return "$mwh MWh";
  } else {
    final kwh = roundAndRemoveTrailingZeros(totalEnergy);
    return "$kwh kWh";
  }
}

String monthToString(int month) {
  switch (month) {
    case DateTime.january:
      return "Jan.";
      break;
    case DateTime.february:
      return "Feb.";
      break;
    case DateTime.march:
      return "Mar.";
      break;
    case DateTime.april:
      return "Apr.";
      break;
    case DateTime.may:
      return "May.";
      break;
    case DateTime.june:
      return "Jun.";
      break;
    case DateTime.july:
      return "Jul.";
      break;
    case DateTime.august:
      return "Aug.";
      break;
    case DateTime.september:
      return "Sep.";
      break;
    case DateTime.october:
      return "Oct.";
      break;
    case DateTime.november:
      return "Nov.";
      break;
    case DateTime.december:
      return "Dec.";
      break;
    default:
      return "Error";
  }
}
