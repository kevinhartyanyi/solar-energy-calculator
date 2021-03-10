import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:formz/formz.dart';
import 'package:green_energy/models/coordinates.dart';
import 'package:green_energy/models/solar_data.dart';
import 'package:green_energy/utils.dart';
import 'package:logging/logging.dart';
import 'package:http/http.dart' as http;
import 'package:latlong/latlong.dart';

part 'calculator_state.dart';
part 'calculator_cubit.freezed.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit()
      : super(CalculatorState.initial(
            latitude: const Coordinate.dirty(48.8566),
            longitude: const Coordinate.dirty(2.3522),
            status: Formz.validate(
                const [Coordinate.dirty(48.8566), Coordinate.dirty(2.3522)]))) {
    mapController = MapController();
  }

  static final _log = Logger("CalculatorCubit");

  MapController mapController;

  void changeCalculatorType() {
    _log.fine("change calculator type advanced: ${!state.advanced}");
    if (state.status.isSubmissionInProgress) {
      _log.fine("dismiss, because submissionInProgress");
      return;
    }
    emit(state.copyWith(advanced: !state.advanced));
  }

  void moveMap(LatLng latLng) {
    _log.fine("move map to lat: ${latLng.latitude}, lon: ${latLng.longitude}");
    if (state.status.isSubmissionInProgress) {
      _log.fine("dismiss, because submissionInProgress");
      return;
    }
    mapController.move(latLng, 13);
  }

  void changeLatitude(double lat) {
    _log.fine("change latitude to $lat");
    if (state.status.isSubmissionInProgress) {
      _log.fine("dismiss, because submissionInProgress");
      return;
    }
    final latitude = Coordinate.dirty(lat);
    moveMap(LatLng(latitude.value, state.longitude.value));
    emit(
      state.copyWith(
          latitude: latitude,
          status: Formz.validate([latitude, state.longitude])),
    );
  }

  void changeLongitude(double lon) {
    _log.fine("change longitude to $lon");
    if (state.status.isSubmissionInProgress) {
      _log.fine("dismiss, because submissionInProgress");
      return;
    }
    final longitude = Coordinate.dirty(lon);
    moveMap(LatLng(state.latitude.value, longitude.value));
    emit(
      state.copyWith(
          longitude: longitude,
          status: Formz.validate([state.latitude, longitude])),
    );
  }

  void changeCoords({@required double lat, @required double lon}) {
    final latitude = Coordinate.dirty(lat);
    final longitude = Coordinate.dirty(lon);
    //moveMap(LatLng(latitude.value, longitude.value));
    _log.fine("change coords to lat: $lat, lon: $lon");
    if (state.status.isSubmissionInProgress) {
      _log.fine("dismiss, because submissionInProgress");
      return;
    }
    emit(
      state.copyWith(
          latitude: latitude,
          longitude: longitude,
          status: Formz.validate([latitude, longitude])),
    );
  }

  void changePeakPower(int peakpower) {
    _log.fine("change peakpower to $peakpower");
    if (state.status.isSubmissionInProgress) {
      _log.fine("dismiss, because submissionInProgress");
      return;
    }
    emit(state.copyWith(peakpower: peakpower));
  }

  void changeSystemLoss(double loss) {
    _log.fine("change loss to $loss");
    if (state.status.isSubmissionInProgress) {
      _log.fine("dismiss, because submissionInProgress");
      return;
    }
    emit(state.copyWith(loss: loss));
  }

  Future<void> submit() async {
    if (state.status.isInvalid) {
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
      lat: state.latitude.value,
      lon: state.longitude.value,
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
