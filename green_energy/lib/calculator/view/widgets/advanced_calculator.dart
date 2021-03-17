import 'package:flutter/material.dart';
import 'package:green_energy/calculator/view/widgets/coordinates.dart';
import 'package:green_energy/calculator/view/widgets/geo_map.dart';
import 'package:green_energy/calculator/view/widgets/input_values.dart';

class AdvancedCalculator extends StatelessWidget {
  const AdvancedCalculator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Expanded(
          flex: 8,
          child: GeoMap(),
        ),
        SizedBox(
          height: 8.0,
        ),
        Expanded(child: Coordinates()),
        SizedBox(
          height: 8.0,
        ),
        Expanded(child: PeakPowerInput()),
        SizedBox(
          height: 8.0,
        ),
        Expanded(child: SystemLossInput()),
      ],
    );
  }
}
