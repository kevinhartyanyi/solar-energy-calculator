import 'package:flutter/foundation.dart';
import 'package:connectivity/connectivity.dart';
import 'package:intl/intl.dart';

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

// String roundAndRemoveTrailingZeros(final double n, [int keep = 2]) {
//   print("hallo, $n ${n.truncateToDouble()}");
//   return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : keep);
// }

String roundAndRemoveTrailingZeros(final double n, [int keep = 2]) {
  final NumberFormat formatter = NumberFormat();
  formatter.minimumFractionDigits = 0;
  formatter.maximumFractionDigits = keep;
  return formatter.format(n);
}
