import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_energy/analyze/cubit/analyze_cubit.dart';
import 'package:green_energy/common/my_textfield.dart';
import 'package:green_energy/strings.dart';

class Cost extends StatelessWidget {
  const Cost({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AnalyzeCubit>(context);
    return DoubleTextField(
        name: "Cost of a single panel",
        currentValue: cubit.state.panelCost,
        onChanged: cubit.changePanelCost,
        prefix: false,
        info: costInfo);
  }
}

class ElectricityPrice extends StatelessWidget {
  const ElectricityPrice({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AnalyzeCubit>(context);
    return DoubleTextField(
        name: "Electricity Price",
        currentValue: cubit.state.electricityPrice,
        onChanged: cubit.changeElectricityPricePrice,
        prefix: false,
        info: electricityPriceInfo);
  }
}

class Amount extends StatelessWidget {
  const Amount({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AnalyzeCubit>(context);
    return IntTextField(
      name: "Amount",
      currentValue: cubit.state.amount,
      onChanged: cubit.changeAmount,
      prefix: false,
      info: amountInfo,
    );
  }
}
