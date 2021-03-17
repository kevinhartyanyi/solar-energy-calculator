import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:green_energy/calculator/cubit/calculator_cubit.dart';
import 'package:green_energy/calculator/view/widgets/map_marker.dart';
import 'package:green_energy/calculator/view/widgets/zoombuttons_plugin_options.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:latlong/latlong.dart';

class GeoMap extends StatefulWidget {
  const GeoMap({Key key}) : super(key: key);

  @override
  _GeoMapState createState() => _GeoMapState();
}

class _GeoMapState extends State<GeoMap> {
  @override
  void initState() {
    super.initState();
    context.read<CalculatorCubit>().mapController = MapController();
  }

  void mapOnTap(BuildContext context, LatLng latLong) {
    final cubit = BlocProvider.of<CalculatorCubit>(context);
    cubit.changeCoords(lat: latLong.latitude, lon: latLong.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BlocBuilder<CalculatorCubit, CalculatorState>(
        buildWhen: (previous, current) =>
            previous.latitude != current.latitude ||
            previous.longitude != current.longitude,
        builder: (context, state) {
          final h = MediaQuery.of(context).size.height;
          final theme = ThemeProvider.themeOf(context).data;
          final cubit = BlocProvider.of<CalculatorCubit>(context);
          final marker = [
            Marker(
                point: LatLng(state.latitude.value, state.longitude.value),
                width: h * 0.03,
                height: h * 0.03,
                builder: (context) {
                  return const MapMarker();
                })
          ];
          return FlutterMap(
            mapController: cubit.mapController,
            options: MapOptions(
                center: LatLng(
                    cubit.state.latitude.value, cubit.state.longitude.value),
                zoom: 5.0,
                plugins: [
                  ZoomButtonsPlugin(),
                ],
                onTap: (latLong) {
                  mapOnTap(context, latLong);
                }),
            layers: [
              TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
              MarkerLayerOptions(markers: marker),
            ],
            nonRotatedLayers: [
              ZoomButtonsPluginOption(
                minZoom: 4,
                maxZoom: 19,
                // ignore: avoid_redundant_argument_values
                mini: true,
                padding: 10,
                zoomInColorIcon: theme.accentColor,
                zoomOutColorIcon: theme.accentColor,
                alignment: Alignment.bottomRight,
              ),
            ],
          );
        },
      ),
    );
  }
}
