import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MapMarker extends StatelessWidget {
  const MapMarker({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final theme = ThemeProvider.themeOf(context).data;
    return Icon(
      MdiIcons.mapMarker,
      color: Colors.red.shade300,
    );
  }
}
