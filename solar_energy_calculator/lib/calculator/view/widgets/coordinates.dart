import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_energy_calculator/calculator/cubit/calculator_cubit.dart';
import 'package:solar_energy_calculator/common/my_textfield.dart';

class Coordinates extends StatelessWidget {
  const Coordinates({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: LatitudeInput()),
        SizedBox(
          width: 16.0,
        ),
        Expanded(child: LongitudeInput())
      ],
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
