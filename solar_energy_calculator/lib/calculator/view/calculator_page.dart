import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_energy_calculator/calculator/cubit/calculator_cubit.dart';
import 'package:formz/formz.dart';
import 'package:solar_energy_calculator/calculator/view/widgets/calculator_type.dart';
import 'package:solar_energy_calculator/calculator/view/widgets/select_calculator_type.dart';
import 'package:solar_energy_calculator/calculator/view/widgets/submit_button.dart';
import 'package:solar_energy_calculator/common/my_column.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:solar_energy_calculator/router/my_router.dart';
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
          ScaffoldMessenger.of(context)
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
          Expanded(flex: 8, child: CalculatorType()),
          Expanded(child: SubmitButton()),
          SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }
}
