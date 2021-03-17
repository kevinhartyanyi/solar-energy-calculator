import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_energy/calculator/cubit/calculator_cubit.dart';
import 'package:green_energy/calculator/view/widgets/advanced_calculator.dart';
import 'package:green_energy/calculator/view/widgets/simple_calculator.dart';

class CalculatorType extends StatelessWidget {
  const CalculatorType({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorCubit, CalculatorState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: state.advanced
              ? const AdvancedCalculator()
              : const SimpleCalculator(),
        );
      },
    );
  }
}