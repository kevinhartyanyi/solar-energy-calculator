import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_energy/calculator/cubit/calculator_cubit.dart';
import 'package:formz/formz.dart';
import 'package:green_energy/common/my_column.dart';
import 'package:green_energy/common/my_text.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:green_energy/utils.dart';
import 'package:latlong/latlong.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFBF8F3),
      body: SafeArea(
        child: Material(
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
          //context.navigator.pop();
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Success")),
            );
        }
      },
      child: MyColumn(
        children: [
          Expanded(child: SelectCalculatorType()),
          Expanded(
            flex: 5,
            child: GeoMap(),
          ),
          Expanded(child: LatitudeInput()),
          Expanded(child: LongitudeInput()),
          Expanded(child: SubmitButton()),
        ],
      ),
    );
  }
}

class SelectCalculatorType extends StatelessWidget {
  const SelectCalculatorType({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: MyText("Simple"),
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
        return InputDoubleButton(
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
        return InputDoubleButton(
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

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CalculatorCubit>(context);
    return FlutterMap(
      mapController: cubit.mapController,
      options: MapOptions(
          center:
              LatLng(cubit.state.latitude.value, cubit.state.longitude.value),
          zoom: 4.0,
          onTap: (latLong) {
            final cubit = BlocProvider.of<CalculatorCubit>(context);
            cubit.changeCoords(lat: latLong.latitude, lon: latLong.longitude);
          }),
      layers: [
        TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
      ],
    );
  }
}

class InputDoubleButton extends StatelessWidget {
  const InputDoubleButton(
      {Key key,
      @required this.name,
      @required this.onChanged,
      @required this.currentValue})
      : super(key: key);

  final String name;
  final double currentValue;
  final Function(double) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: MyText(name)),
        const SizedBox(
          width: 8,
        ),
        Expanded(
            child: DoubleTextField(
          currentValue: currentValue,
          onChanged: onChanged,
        ))
      ],
    );
  }
}

class DoubleTextField extends StatelessWidget {
  const DoubleTextField(
      {Key key, @required this.onChanged, @required this.currentValue})
      : super(key: key);

  final Function(double) onChanged;
  final double currentValue;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    controller.text = roundAndRemoveTrailingZeros(currentValue, 3).toString();
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));
    return TextField(
      onChanged: (text) {
        print(text);
        onChanged(double.parse(text));
      },
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d{0,3})'))
      ],
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final cubit = BlocProvider.of<CalculatorCubit>(context);
        //cubit.changeCoordinates(40, 30);
        cubit.submit();
      },
      child: Container(
        color: Colors.white,
        child: MyText("Calculate"),
      ),
    );
  }
}
