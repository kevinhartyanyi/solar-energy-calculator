import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_energy/analyze/cubit/analyze_cubit.dart';
import 'package:green_energy/analyze/view/widgets/average_monthly_energy_chart.dart';
import 'package:green_energy/analyze/view/widgets/input_values.dart';
import 'package:green_energy/analyze/view/widgets/money_saved_chart.dart';
import 'package:green_energy/analyze/view/widgets/value_displays.dart';
import 'package:green_energy/models/calculation_box.dart';
import 'package:green_energy/common/card_base.dart';
import 'package:green_energy/common/card_base_button.dart';
import 'package:green_energy/common/my_dialog.dart';
import 'package:green_energy/common/my_text.dart';
import 'package:green_energy/common/my_textfield.dart';
import 'package:green_energy/constans.dart';
import 'package:green_energy/models/solar_data.dart';
import 'package:green_energy/utils.dart';
import 'package:hive/hive.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:auto_route/auto_route.dart';

class AnalyzePage extends StatelessWidget {
  const AnalyzePage({Key key, @required this.solarData}) : super(key: key);

  final SolarData solarData;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.themeOf(context).data;
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.backgroundColor,
        body: Material(
          child: BlocProvider(
            create: (context) => AnalyzeCubit(solarData),
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
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: const [
        AvgMonthlyEnergyChart(),
        SizedBox(
          height: 8.0,
        ),
        AmountAndElectricityPrice(),
        SizedBox(
          height: 8.0,
        ),
        Cost(),
        SizedBox(
          height: 8.0,
        ),
        DateInput(),
        SizedBox(
          height: 8.0,
        ),
        ListDivider(),
        SizedBox(
          height: 8.0,
        ),
        TotalEnergy(),
        SizedBox(
          height: 8.0,
        ),
        MoneySaved(),
        SizedBox(
          height: 8.0,
        ),
        CO2Reduction(),
        SizedBox(
          height: 8.0,
        ),
        MoneySavedChart(),
        SizedBox(
          height: 8.0,
        ),
        TimeToBreakEven(),
        SizedBox(
          height: 8.0,
        ),
        SaveButton(),
      ],
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
    cubit.changeName(name);
    final newCalculation = CalculationBox.fromAnalyzeState(cubit.state);
    Hive.box(calculationsBox).add(newCalculation);
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return CardBaseButton(
      onTap: () => onTap(context),
      text: "Save",
      bold: true,
      textSize: h * 0.044,
    );
  }
}

class ChooseName extends StatefulWidget {
  const ChooseName({
    Key key,
    @required this.currentName,
    @required this.onSave,
  }) : super(key: key);

  final String currentName;
  final Function(String) onSave;

  @override
  _ChooseNameState createState() => _ChooseNameState();
}

class _ChooseNameState extends State<ChooseName> {
  String name;

  @override
  void initState() {
    super.initState();
    name = widget.currentName;
  }

  void changeName(String text) {
    setState(() {
      name = text;
    });
  }

  Widget displayErrorMessage(ThemeData theme) {
    if (name.isEmpty) {
      return MyText(
        "Name can't be empty",
        textColor: theme.errorColor,
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;
    final theme = ThemeProvider.themeOf(context).data;
    return MyDialog(
      width: w * 0.6,
      height: w * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const MyText(
            "Choose a name",
          ),
          Divider(
            color: theme.accentColor.withOpacity(0.3),
            thickness: 3.0,
            indent: w * 0.1,
            endIndent: w * 0.1,
          ),
          StringTextField(
            currentValue: name,
            name: "",
            onChanged: (text) => changeName(text),
          ),
          displayErrorMessage(theme),
          CardBaseButton(
            onTap: () {
              if (name.isEmpty) {
                return;
              }
              widget.onSave(name);
              context.navigator.pop();
            },
            text: "Save",
            bold: true,
            background: theme.backgroundColor,
          )
        ],
      ),
    );
  }
}

class ListDivider extends StatelessWidget {
  const ListDivider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final theme = ThemeProvider.themeOf(context).data;
    return Divider(
      color: theme.accentColor.withOpacity(0.3),
      thickness: 3.0,
      indent: w * 0.1,
      endIndent: w * 0.1,
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

class AmountAndElectricityPrice extends StatelessWidget {
  const AmountAndElectricityPrice({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return SizedBox(
      height: h * 0.08,
      child: Row(
        children: const [
          Expanded(child: Amount()),
          SizedBox(
            width: 12.0,
          ),
          Expanded(child: ElectricityPrice()),
        ],
      ),
    );
  }
}
