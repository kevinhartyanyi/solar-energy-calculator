import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_energy_calculator/analyze/cubit/analyze_cubit.dart';
import 'package:solar_energy_calculator/common/card_base.dart';
import 'package:solar_energy_calculator/common/display_value.dart';
import 'package:solar_energy_calculator/common/my_text.dart';
import 'package:solar_energy_calculator/utils.dart';
import 'package:theme_provider/theme_provider.dart';

class TotalEnergy extends StatelessWidget {
  const TotalEnergy({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalyzeCubit, AnalyzeState>(
      builder: (context, state) {
        final h = MediaQuery.of(context).size.height;
        final totalEnergyString = formatTotalEnergy(state.totalEnergy);
        return DisplayValue(
          height: h * 0.08,
          name: "Total Energy",
          value: totalEnergyString,
        );
      },
    );
  }
}

class MoneySaved extends StatelessWidget {
  const MoneySaved({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalyzeCubit, AnalyzeState>(
      builder: (context, state) {
        final h = MediaQuery.of(context).size.height;
        final moneySaved = getMoneySaved(
            state.totalEnergy, state.electricityPrice, state.amount);
        return DisplayValue(
          height: h * 0.08,
          name: "Money saved",
          value: roundAndRemoveTrailingZeros(moneySaved),
        );
      },
    );
  }
}

class CO2Reduction extends StatelessWidget {
  const CO2Reduction({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalyzeCubit, AnalyzeState>(
      builder: (context, state) {
        final h = MediaQuery.of(context).size.height;
        final co2Reduction = getCO2Reduction(state.totalEnergy);
        final co2ReductionString = formatCO2Reduction(co2Reduction);
        return DisplayValue(
          height: h * 0.08,
          name: "CO2 Reduction",
          value: co2ReductionString,
        );
      },
    );
  }
}

class TimeToBreakEven extends StatelessWidget {
  const TimeToBreakEven({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;
    final theme = ThemeProvider.themeOf(context).data;
    return CardBase(
      padding: const EdgeInsets.fromLTRB(8.0, 10, 8.0, 10),
      child: Column(
        children: [
          MyText(
            "Time to break even",
            textColor: theme.accentColor,
            textSize: h * 0.04,
          ),
          Divider(
            color: theme.textTheme.bodyText1.color.withOpacity(0.1),
            thickness: 2.0,
            indent: w * 0.1,
            endIndent: w * 0.1,
          ),
          BlocBuilder<AnalyzeCubit, AnalyzeState>(
            builder: (context, state) {
              final monthsToBreakEven =
                  context.read<AnalyzeCubit>().timeToBreakEvenInMonths();
              final yearsToBreakEven =
                  roundAndRemoveTrailingZeros(monthsToBreakEven / 12);
              return MyText(
                "$yearsToBreakEven years",
                textSize: h * 0.03,
              );
            },
          )
        ],
      ),
    );
  }
}
