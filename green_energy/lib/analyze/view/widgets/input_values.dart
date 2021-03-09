import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_energy/analyze/cubit/analyze_cubit.dart';
import 'package:green_energy/common/my_textfield.dart';

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
        info:
            'This is used for calculating the amount of time that you would need to break even.\nYou can use any currency, just keep it consistent with the "electricity price"');
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
        info:
            'This is used for calculating the money saved by using the solar panel(s).\nYou can use any currency, just keep it consistent with the "cost of a single panel".');
  }
}

class Amount extends StatelessWidget {
  const Amount({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final cubit = BlocProvider.of<AnalyzeCubit>(context);
    return IntTextField(
      name: "Amount",
      currentValue: cubit.state.amount,
      onChanged: cubit.changeAmount,
      prefix: false,
      info: "The number of solar panels that you want to calculate with.",
    );
  }
}
