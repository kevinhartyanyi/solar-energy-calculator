import 'package:flutter/material.dart';
import 'package:green_energy/calculator/view/widgets/coordinates.dart';
import 'package:green_energy/calculator/view/widgets/geo_map.dart';

class SimpleCalculator extends StatelessWidget {
  const SimpleCalculator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Expanded(
          flex: 6,
          child: GeoMap(),
        ),
        SizedBox(
          height: 8.0,
        ),
        Expanded(child: Coordinates()),
      ],
    );
  }
}
