import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_energy_calculator/analyze/cubit/analyze_cubit.dart';
import 'package:solar_energy_calculator/analyze/view/widgets/average_monthly_energy_chart.dart';
import 'package:solar_energy_calculator/analyze/view/widgets/choose_name.dart';
import 'package:solar_energy_calculator/analyze/view/widgets/input_values.dart';
import 'package:solar_energy_calculator/analyze/view/widgets/list_divider.dart';
import 'package:solar_energy_calculator/analyze/view/widgets/money_saved_chart.dart';
import 'package:solar_energy_calculator/analyze/view/widgets/value_displays.dart';
import 'package:solar_energy_calculator/common/card_base_button.dart';
import 'package:solar_energy_calculator/models/calculation_item.dart';
import 'package:solar_energy_calculator/models/solar_data.dart';
import 'package:theme_provider/theme_provider.dart';

class AnalyzePage extends StatelessWidget {
  const AnalyzePage({Key key, this.solarData, this.loadData}) : super(key: key);

  final SolarData solarData;
  final CalculationItem loadData;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.themeOf(context).data;
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.backgroundColor,
        body: Material(
          child: BlocProvider(
            create: (context) =>
                AnalyzeCubit(solarData: solarData, loadData: loadData),
            child: const Analyze(),
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
    const listItems = [
      AvgMonthlyEnergyChart(),
      AmountAndElectricityPrice(),
      Cost(),
      DateInput(),
      ListDivider(),
      TotalEnergy(),
      MoneySaved(),
      CO2Reduction(),
      MoneySavedChart(),
      TimeToBreakEven(),
      SaveButton(),
    ];
    return ListView.separated(
      itemCount: listItems.length,
      padding: const EdgeInsets.all(8.0),
      itemBuilder: (context, index) {
        return listItems[index];
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 8.0,
        );
      },
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({Key key}) : super(key: key);

  void onTap(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return ChooseName(
            onSave: (name) => onSave(name, context),
            currentName: context.read<AnalyzeCubit>().state.name,
          );
        });
  }

  void onSave(String name, BuildContext context) {
    final cubit = context.read<AnalyzeCubit>();
    cubit.saveCalculation(name);
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final cubit = context.read<AnalyzeCubit>();
    return CardBaseButton(
      onTap: () => onTap(context),
      text: cubit.state.loaded ? "Change" : "Save",
      bold: true,
      textSize: h * 0.044,
    );
  }
}
