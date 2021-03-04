import 'dart:convert';

import 'package:equatable/equatable.dart';

class SolarData extends Equatable {
  final double latitude;
  final double longitude;
  final double elevation;

  //final String mounting;

  final double peakpower;
  final double systemLoss;
  final String technology;

  final List<double> avgMonthlyEnergy;

  SolarData(
      {this.latitude,
      this.longitude,
      this.elevation,
      this.peakpower,
      this.systemLoss,
      this.technology,
      this.avgMonthlyEnergy});

  @override
  List<Object> get props => [
        latitude,
        longitude,
        elevation,
        peakpower,
        systemLoss,
        technology,
        avgMonthlyEnergy
      ];

  factory SolarData.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    final inputs = map['inputs'];
    final outputs = map['outputs'];

    final location = inputs['location'];
    final pvModule = inputs['pv_module'];
    final mountingSystem = inputs['mounting_system'];

    final monthlyData = outputs['monthly']['fixed'];
    //print(monthlyData);

    return SolarData(
      latitude: location['latitude'] as double,
      longitude: location['longitude'] as double,
      elevation: location['elevation'] as double,
      peakpower: pvModule['peakpower'] as double,
      systemLoss: pvModule['systemLoss'] as double,
      technology: pvModule['technology'] as String,
      avgMonthlyEnergy: (monthlyData as List<dynamic>)
          .map((data) => data['E_m'] as double)
          .toList(growable: false),
    );
  }

  factory SolarData.fromJson(String source) =>
      SolarData.fromMap(json.decode(source) as Map<String, dynamic>);
}

/**
"variables": {
                    "E_d": {
                        "description": "Average daily energy production from the given system",
                        "units": "kWh/d"
                    },
                    "E_m": {
                        "description": "Average monthly energy production from the given system",
                        "units": "kWh/mo"
                    },
                    "E_y": {
                        "description": "Average annual energy production from the given system",
                        "units": "kWh/y"
                    },
                    "H(i)_d": {
                        "description": "Average daily sum of global irradiation per square meter received by the modules of the given system",
                        "units": "kWh/m2/d"
                    },
                    "H(i)_m": {
                        "description": "Average monthly sum of global irradiation per square meter received by the modules of the given system",
                        "units": "kWh/m2/mo"
                    },
                    "H(i)_y": {
                        "description": "Average annual sum of global irradiation per square meter received by the modules of the given system",
                        "units": "kWh/m2/y"
                    },
                    "SD_m": {
                        "description": "Standard deviation of the monthly energy production due to year-to-year variation",
                        "units": "kWh"
                    },
                    "SD_y": {
                        "description": "Standard deviation of the annual energy production due to year-to-year variation",
                        "units": "kWh"
                    },
                    "l_aoi": {
                        "description": "Angle of incidence loss",
                        "units": "%"
                    },
                    "l_spec": {
                        "description": "Spectral loss",
                        "units": "%"
                    },
                    "l_tg": {
                        "description": "Temperature and irradiance loss",
                        "units": "%"
                    },
                    "l_total": {
                        "description": "Total loss",
                        "units": "%"
                    }
                }
 */
