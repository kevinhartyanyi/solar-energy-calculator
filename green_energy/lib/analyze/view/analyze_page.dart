import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_energy/analyze/cubit/analyze_cubit.dart';
import 'package:green_energy/common/input_buttons.dart';
import 'package:green_energy/common/my_column.dart';
import 'package:green_energy/common/my_text.dart';
import 'package:green_energy/common/my_textfield.dart';
import 'package:green_energy/models/solar_data.dart';
import 'package:green_energy/utils.dart';
import 'package:intl/intl.dart';

class AnalyzePage extends StatelessWidget {
  const AnalyzePage({Key key, @required this.solarData}) : super(key: key);

  final SolarData solarData;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFBF8F3),
        body: Material(
          child: BlocProvider(
            create: (context) => AnalyzeCubit(solarData),
            child: Analyze(),
          ),
        ),
      ),
    );
  }
}

class Analyze extends StatelessWidget {
  const Analyze({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AnalyzeCubit>(context);
    final state = cubit.state;
    return MyColumn(
      children: [
        TmpChart(),
        IntTextField(
          name: "Amount",
          currentValue: state.amount,
          onChanged: cubit.changeAmount,
        ),
        InstalmentDate(),
        DoubleTextField(
          name: "Electricity Price",
          currentValue: state.electricityPrice,
          onChanged: cubit.changeElectricityPricePrice,
        ),
        DoubleTextField(
          name: "Cost of a single panel",
          currentValue: state.panelCost,
          onChanged: cubit.changePanelCost,
        ),
        Results(),
      ],
    );
  }
}

class InstalmentDate extends StatelessWidget {
  const InstalmentDate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        datePicker(
            context: context,
            onPicked: context.read<AnalyzeCubit>().changeInstalment,
            isLightTheme: true);
      },
      child: BlocBuilder<AnalyzeCubit, AnalyzeState>(
        builder: (context, state) {
          final Locale myLocale = Localizations.localeOf(context);
          final date =
              DateFormat.yMd(myLocale.languageCode).format(state.instalment);
          return MyText(
            "InstalmentDate: $date",
          );
        },
      ),
    );
  }
}

class Results extends StatelessWidget {
  const Results({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalyzeCubit, AnalyzeState>(
      builder: (context, state) {
        final totalEnergy =
            getTotalEnergyProduced(state.solarData, state.instalment);
        final savedMoney = getMoneySaved(totalEnergy, state.electricityPrice);
        final co2Reduction = getCO2Reduction(totalEnergy);
        return Column(
          children: [
            MyText("Total Energy: $totalEnergy"),
            MyText("Money saved: $savedMoney"),
            MyText("CO2 reduction: $co2Reduction")
          ],
        );
      },
    );
  }
}

class TmpChart extends StatelessWidget {
  const TmpChart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalyzeCubit, AnalyzeState>(
      builder: (context, state) {
        return MyText(state.solarData.avgMonthlyEnergy.toString());
      },
    );
  }
}
