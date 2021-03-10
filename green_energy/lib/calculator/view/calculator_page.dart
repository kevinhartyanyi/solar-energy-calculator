import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_energy/calculator/cubit/calculator_cubit.dart';
import 'package:formz/formz.dart';
import 'package:green_energy/calculator/view/widgets/coordinates.dart';
import 'package:green_energy/calculator/view/widgets/geo_map.dart';
import 'package:green_energy/common/card_base.dart';
import 'package:green_energy/common/my_column.dart';
import 'package:green_energy/common/my_switch.dart';
import 'package:green_energy/common/my_text.dart';
import 'package:green_energy/common/my_textfield.dart';
import 'package:green_energy/strings.dart';
import 'package:theme_provider/theme_provider.dart';
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

class AdvancedCalculator extends StatelessWidget {
  const AdvancedCalculator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Expanded(
          flex: 8,
          child: GeoMap(),
        ),
        SizedBox(
          height: 8.0,
        ),
        Expanded(child: Coordinates()),
        SizedBox(
          height: 8.0,
        ),
        Expanded(child: PeakPowerInput()),
        SizedBox(
          height: 8.0,
        ),
        Expanded(child: SystemLossInput()),
      ],
    );
  }
}

class SimpleCalculator extends StatelessWidget {
  const SimpleCalculator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Expanded(
          flex: 6,
          child: GeoMap(),
        ),
        SizedBox(
          height: 8.0,
        ),
        Expanded(child: Coordinates()),
      ],
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
