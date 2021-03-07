import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_energy/analyze/cubit/analyze_cubit.dart';
import 'package:green_energy/common/display_value.dart';
import 'package:green_energy/utils.dart';

class TotalEnergy extends StatelessWidget {
  const TotalEnergy({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalyzeCubit, AnalyzeState>(
      builder: (context, state) {
        final h = MediaQuery.of(context).size.height;
        return DisplayValue(
          height: h * 0.08,
          name: "Total Energy",
          value: roundAndRemoveTrailingZeros(state.totalEnergy),
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
        final moneySaved =
            getMoneySaved(state.totalEnergy, state.electricityPrice);
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
        return DisplayValue(
          height: h * 0.08,
          name: "CO2 Reduction",
          value: roundAndRemoveTrailingZeros(co2Reduction),
        );
      },
    );
  }
}
