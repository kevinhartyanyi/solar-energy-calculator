import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:formz/formz.dart';
import 'package:green_energy/models/solar_data.dart';
import 'package:green_energy/utils.dart';
import 'package:logging/logging.dart';
import 'package:http/http.dart' as http;

part 'calculator_state.dart';
part 'calculator_cubit.freezed.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(const CalculatorState.initial());

  static final _log = Logger("CalculatorCubit");

  void changeLatitude(double lat) {
    emit(state.copyWith(latitude: lat));
  }

  void changeLongitude(double lon) {
    emit(state.copyWith(longitude: lon));
  }

  void changePeakPower(double peakPower) {
    emit(state.copyWith(peakpower: peakPower));
  }

  void changeSystemLoss(double loss) {
    emit(state.copyWith(loss: loss));
  }

  Future<void> submit() async {
    // TODO put this logic inside a validation class
    if (state.latitude == null || state.longitude == null) {
      _log.warning("invalid status when submitting");
      return;
    }
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    if (await isOffline()) {
      _log.warning("device is offline");
      emit(state.copyWith(
          errorMessage: "You can't do this while you're offline",
          status: FormzStatus.submissionFailure));
      return;
    }
    final url = urlBuilder(
      lat: state.latitude,
      lon: state.longitude,
      peakpower: state.peakpower / 1000, // We use W/h, but the api need kW/h
      loss: state.loss,
    );
    try {
      _log.info("Sending request to ${url.path}");
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final solarData = SolarData.fromJson(response.body);
        for (var item in solarData.avgMonthlyEnergy) {
          print(item);
        }
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess, solarData: solarData));
      } else {
        throw Exception('Bad response: ${response.statusCode}');
      }
    } on Exception catch (e) {
      _log.severe("submit failed: Error: ${e.toString()}");
      emit(state.copyWith(
          errorMessage: "Unexpected error while calculating result",
          status: FormzStatus.submissionFailure));
    }
  }
}
