import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_energy/calculator/cubit/calculator_cubit.dart';
import 'package:green_energy/common/my_switch.dart';

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
