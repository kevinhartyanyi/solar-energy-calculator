// ignore_for_file: prefer_const_declarations
// ignore_for_file: avoid_redundant_argument_values
import 'package:green_energy/constans.dart';
import 'package:green_energy/utils.dart';
import 'package:test/test.dart';

import 'dummy.dart';

void main() {
  group('roundAndRemoveTrailingZeros', () {
    test('return correct rounding', () {
      final check = roundAndRemoveTrailingZeros(3.4562);
      expect(check, "3.46");
    });
    test('return correct rounding with optional paramter', () {
      final check = roundAndRemoveTrailingZeros(3.4562, 3);
      expect(check, "3.456");
    });

    test('return correct length', () {
      final check = roundAndRemoveTrailingZeros(3);
      expect(check, "3");
    });
  });

  group('getMoneySaved', () {
    test('check value', () {
      const double energy = 15;
      const electricityPrice = 0.22;
      expect(getMoneySaved(energy, electricityPrice, 1),
          energy * electricityPrice);
    });
  });

  group('getCO2Reduction', () {
    test('check value', () {
      const double energy = 15;
      expect(getCO2Reduction(energy), energy * co2PerKwh);
    });
  });

  group('getTotalEnergyProduced', () {
    final solarData = dummySolarData;
    test('check 2 month difference', () {
      final instalment = DateTime(2019, 1);
      final end = DateTime(2019, 3);

      final totalEnergy = getTotalEnergyProduced(solarData, instalment, end);
      final expectedFromStartMonth = 31 * (solarData.avgMonthlyEnergy[0] / 31);
      final expectedFromEndMonth = 1 * (solarData.avgMonthlyEnergy[2] / 31);
      final expectedFromMonths = solarData.avgMonthlyEnergy[1];
      //print("Expected start month $expectedFromStartMonth");
      //print("Expected current month $expectedFromEndMonth");
      //print("Expected energy for months $expectedFromMonths");
      expect(totalEnergy,
          expectedFromStartMonth + expectedFromMonths + expectedFromEndMonth);
    });

    test('check 4 month difference', () {
      final instalment = DateTime(2019, 1);
      final end = DateTime(2019, 5);

      final totalEnergy = getTotalEnergyProduced(solarData, instalment, end);
      final expectedFromStartMonth = 31 * (solarData.avgMonthlyEnergy[0] / 31);
      final expectedFromEndMonth = 1 * (solarData.avgMonthlyEnergy[4] / 31);
      final expectedFromMonths = solarData.avgMonthlyEnergy[1] +
          solarData.avgMonthlyEnergy[2] +
          solarData.avgMonthlyEnergy[3];
      //print("Expected start month $expectedFromStartMonth");
      //print("Expected current month $expectedFromEndMonth");
      //print("Expected energy for months $expectedFromMonths");
      expect(totalEnergy,
          expectedFromStartMonth + expectedFromMonths + expectedFromEndMonth);
    });

    test('check same month', () {
      final instalment = DateTime(2019, 1, 3);
      final end = DateTime(2019, 1, 16);

      final totalEnergy = getTotalEnergyProduced(solarData, instalment, end);
      final expectedFromStartMonth = 13 * (solarData.avgMonthlyEnergy[0] / 31);
      final expectedFromEndMonth = 0;
      final expectedFromMonths = 0;
      //print("Expected start month $expectedFromStartMonth");
      //print("Expected current month $expectedFromEndMonth");
      //print("Expected energy for months $expectedFromMonths");
      expect(totalEnergy,
          expectedFromStartMonth + expectedFromMonths + expectedFromEndMonth);
    });

    test('check current day is end of month', () {
      final instalment = DateTime(2019, 1, 3);
      final end = DateTime(2019, 3, 31);

      final totalEnergy = getTotalEnergyProduced(solarData, instalment, end);
      final expectedFromStartMonth = 29 * (solarData.avgMonthlyEnergy[0] / 31);
      final expectedFromEndMonth = 31 * (solarData.avgMonthlyEnergy[2] / 31);
      final expectedFromMonths = solarData.avgMonthlyEnergy[1];
      //print("Expected start month $expectedFromStartMonth");
      //print("Expected current month $expectedFromEndMonth");
      //print("Expected energy for months $expectedFromMonths");
      expect(totalEnergy,
          expectedFromStartMonth + expectedFromMonths + expectedFromEndMonth);
    });

    test('check year change', () {
      final instalment = DateTime(2019, 12, 15);
      final end = DateTime(2020, 1, 15);

      final totalEnergy = getTotalEnergyProduced(solarData, instalment, end);
      final expectedFromStartMonth = 17 * (solarData.avgMonthlyEnergy[11] / 31);
      final expectedFromEndMonth = 15 * (solarData.avgMonthlyEnergy[0] / 31);
      final expectedFromMonths = 0;
      //print("Expected start month $expectedFromStartMonth");
      //print("Expected current month $expectedFromEndMonth");
      //print("Expected energy for months $expectedFromMonths");
      expect(totalEnergy,
          expectedFromStartMonth + expectedFromMonths + expectedFromEndMonth);
    });

    test('check more than 1 year', () {
      final instalment = DateTime(2018, 1, 15);
      final end = DateTime(2019, 2, 15);

      final totalEnergy = getTotalEnergyProduced(solarData, instalment, end);
      final expectedFromStartMonth = 17 * (solarData.avgMonthlyEnergy[0] / 31);
      final expectedFromEndMonth = 15 * (solarData.avgMonthlyEnergy[1] / 28);
      final expectedFromMonths = solarData.avgMonthlyEnergy
              .reduce((value, element) => value + element) -
          solarData.avgMonthlyEnergy[0] +
          solarData.avgMonthlyEnergy[0];
      //print("Expected start month $expectedFromStartMonth");
      //print("Expected current month $expectedFromEndMonth");
      //print("Expected energy for months $expectedFromMonths");
      expect(totalEnergy,
          expectedFromStartMonth + expectedFromMonths + expectedFromEndMonth);
    });

    test('check 1 year', () {
      final instalment = DateTime(2020, 3, 7);
      final end = DateTime(2021, 3, 7);

      final totalEnergy = getTotalEnergyProduced(solarData, instalment, end);
      final expectedFromStartMonth = 25 * (solarData.avgMonthlyEnergy[2] / 31);
      final expectedFromEndMonth = 7 * (solarData.avgMonthlyEnergy[2] / 31);
      final expectedFromMonths = solarData.avgMonthlyEnergy
              .reduce((value, element) => value + element) -
          solarData.avgMonthlyEnergy[2];
      // print("Expected start month $expectedFromStartMonth");
      // print("Expected current month $expectedFromEndMonth");
      // print("Expected energy for months $expectedFromMonths");
      expect(totalEnergy,
          expectedFromStartMonth + expectedFromMonths + expectedFromEndMonth);
    });

    test('check same day', () {
      final instalment = DateTime(2019, 1, 2);
      final end = DateTime(2019, 1, 2);

      final totalEnergy = getTotalEnergyProduced(solarData, instalment, end);
      final expectedFromStartMonth = 0;
      final expectedFromEndMonth = 0;
      final expectedFromMonths = 0;
      // print("Expected start month $expectedFromStartMonth");
      // print("Expected current month $expectedFromEndMonth");
      // print("Expected energy for months $expectedFromMonths");
      expect(totalEnergy,
          expectedFromStartMonth + expectedFromMonths + expectedFromEndMonth);
    });
  });
}
