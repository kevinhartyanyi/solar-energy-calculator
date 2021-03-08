import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_energy/calculator/cubit/calculator_cubit.dart';
import 'package:formz/formz.dart';
import 'package:green_energy/calculator/view/widgets/map_marker.dart';
import 'package:green_energy/calculator/view/widgets/zoombuttons_plugin_options.dart';
import 'package:green_energy/common/card_base.dart';
import 'package:green_energy/common/my_column.dart';
import 'package:green_energy/common/my_switch.dart';
import 'package:green_energy/common/my_text.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:green_energy/common/my_textfield.dart';
import 'package:latlong/latlong.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:green_energy/router/my_router.dart';
import 'package:auto_route/auto_route.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.themeOf(context).data;
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
        child: Material(
          color: Colors.transparent,
          child: BlocProvider(
            create: (context) => CalculatorCubit(),
            child: const Calculator(),
          ),
        ),
      ),
    );
  }
}

class Calculator extends StatelessWidget {
  const Calculator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CalculatorCubit, CalculatorState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
        } else if (state.status.isSubmissionSuccess) {
          context.rootNavigator.pushAnalyzePage(solarData: state.solarData);
        }
      },
      child: const MyColumn(
        children: [
          Expanded(child: SelectCalculatorType()),
          Expanded(
            flex: 6,
            child: GeoMap(),
          ),
          SizedBox(
            height: 8.0,
          ),
          Expanded(child: Coordinates()),
          Expanded(child: SubmitButton()),
          SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }
}

class SelectCalculatorType extends StatelessWidget {
  const SelectCalculatorType({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: BlocBuilder<CalculatorCubit, CalculatorState>(
        builder: (context, state) {
          return MySwitch(
              texts: const ["Simple", "Advanced"],
              selected: state.advanced ? 1 : 0,
              onClick: (_) {
                context.read<CalculatorCubit>().changeCalculatorType();
              });
        },
      ),
    );
  }
}

class Coordinates extends StatelessWidget {
  const Coordinates({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Row(
        children: const [
          Expanded(child: LatitudeInput()),
          SizedBox(
            width: 16.0,
          ),
          Expanded(child: LongitudeInput())
        ],
      ),
    );
  }
}

class LatitudeInput extends StatelessWidget {
  const LatitudeInput({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CalculatorCubit>(context);
    return BlocBuilder<CalculatorCubit, CalculatorState>(
      builder: (context, state) {
        return DoubleTextField(
          name: "Lat",
          currentValue: state.latitude.value,
          onChanged: cubit.changeLatitude,
        );
      },
    );
  }
}

class LongitudeInput extends StatelessWidget {
  const LongitudeInput({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CalculatorCubit>(context);
    return BlocBuilder<CalculatorCubit, CalculatorState>(
      builder: (context, state) {
        return DoubleTextField(
          name: "Lon",
          currentValue: state.longitude.value,
          onChanged: cubit.changeLongitude,
        );
      },
    );
  }
}

class GeoMap extends StatelessWidget {
  const GeoMap({Key key}) : super(key: key);

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
                mini: true,
                padding: 10,
                zoomInColorIcon: theme.focusColor,
                zoomOutColorIcon: theme.focusColor,
                alignment: Alignment.bottomRight,
              ),
            ],
          );
        },
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: BlocBuilder<CalculatorCubit, CalculatorState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return state.status.isSubmissionInProgress
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : InkWell(
                  onTap: () {
                    final cubit = BlocProvider.of<CalculatorCubit>(context);
                    cubit.submit();
                  },
                  child: const CardBase(
                    child: Center(
                      child: MyText("Calculate"),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
