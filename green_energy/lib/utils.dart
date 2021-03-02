import 'package:flutter/foundation.dart';
import 'package:connectivity/connectivity.dart';

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
