import 'package:flutter/material.dart';
import 'package:green_energy/calculator/cubit/calculator_cubit.dart';
import 'package:green_energy/common/my_textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_energy/strings.dart';

class SystemLossInput extends StatelessWidget {
  const SystemLossInput({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CalculatorCubit>();
    return DoubleTextField(
      onChanged: (value) {
        cubit.changeSystemLoss(value);
      },
      currentValue: cubit.state.loss,
      name: "System loss",
      suffix: "%",
      info: systemLossInfo,
    );
  }
}

class PeakPowerInput extends StatelessWidget {
  const PeakPowerInput({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CalculatorCubit>();
    return IntTextField(
      onChanged: (value) {
        cubit.changePeakPower(value);
      },
      currentValue: cubit.state.peakpower,
      name: "Peak power",
      suffix: "W",
      info: peakPowerInfo,
    );
  }
}