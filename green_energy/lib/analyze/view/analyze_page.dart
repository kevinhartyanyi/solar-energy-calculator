import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_energy/analyze/cubit/analyze_cubit.dart';
import 'package:green_energy/analyze/view/widgets/input_values.dart';
import 'package:green_energy/analyze/view/widgets/value_displays.dart';
import 'package:green_energy/common/my_text.dart';
import 'package:green_energy/common/my_textfield.dart';
import 'package:green_energy/models/solar_data.dart';
import 'package:green_energy/utils.dart';
import 'package:intl/intl.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:theme_provider/theme_provider.dart';

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
      ],
    );
  }
}

class DateInput extends StatelessWidget {
  const DateInput({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return SizedBox(
      height: h * 0.08,
      child: Row(
        children: const [
          Expanded(child: InstalmentDate()),
          SizedBox(
            width: 12.0,
          ),
          Expanded(child: EndDate()),
        ],
      ),
    );
  }
}

class EndDate extends StatelessWidget {
  const EndDate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        datePicker(
            context: context,
            onPicked: context.read<AnalyzeCubit>().changeEndDate,
            isLightTheme: true);
      },
      child: BlocBuilder<AnalyzeCubit, AnalyzeState>(
        builder: (context, state) {
          final Locale myLocale = Localizations.localeOf(context);
          final date = DateFormat.yMd(myLocale.languageCode).format(state.end);
          return DisplayTextField(
            name: "End",
            value: date,
            prefix: false,
            height: h * 0.08,
          );
        },
      ),
    );
  }
}

class InstalmentDate extends StatelessWidget {
  const InstalmentDate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        final cubit = context.read<AnalyzeCubit>();
        datePicker(
            context: context,
            onPicked: cubit.changeInstalment,
            lastDate: cubit.state.end,
            isLightTheme: true);
      },
      child: BlocBuilder<AnalyzeCubit, AnalyzeState>(
        builder: (context, state) {
          final Locale myLocale = Localizations.localeOf(context);
          final date =
              DateFormat.yMd(myLocale.languageCode).format(state.instalment);
          return DisplayTextField(
            name: "Instalment",
            value: date,
            prefix: false,
            height: h * 0.08,
          );
        },
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

class Chart extends StatelessWidget {
  const Chart({
    Key key,
    @required this.chart,
    this.bottomText,
  }) : super(key: key);

  final Widget chart;
  final String bottomText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: chart),
        ChartBottomDisplay(text: bottomText),
      ],
    );
  }
}

class ChartBottomDisplay extends StatelessWidget {
  const ChartBottomDisplay({Key key, this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: text == null
          ? const SizedBox.shrink()
          : MyText(
              text,
              textSize: h * 0.02,
            ),
    );
  }
}

class AvgMonthlyEnergyChart extends StatelessWidget {
  const AvgMonthlyEnergyChart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalyzeCubit, AnalyzeState>(
      buildWhen: (previous, current) =>
          previous.barChartText != current.barChartText,
      builder: (context, state) {
        final h = MediaQuery.of(context).size.height;
        return SizedBox(
          height: h * 0.5,
          child: Chart(
            chart: const BarChart(),
            bottomText: state.barChartText,
          ),
        );
      },
    );
  }
}

class BarChart extends StatelessWidget {
  const BarChart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalyzeCubit, AnalyzeState>(
        buildWhen: (previous, current) =>
            previous.solarData != current.solarData,
        builder: (context, state) {
          final cubit = BlocProvider.of<AnalyzeCubit>(context);
          final theme = ThemeProvider.themeOf(context).data;
          final seriesList =
              cubit.getSumTimes("AvgMonthlyEnergyBarChart", theme);
          final textColor =
              charts.ColorUtil.fromDartColor(theme.textTheme.bodyText1.color);
          final h = MediaQuery.of(context).size.height;
          return charts.BarChart(
            seriesList,
            animate: true,
            behaviors: [
              charts.ChartTitle(
                "Average Monthly Energy Output (kWh)",
                titleStyleSpec: charts.TextStyleSpec(
                    fontSize: (h * 0.018).toInt(), // size in Pts.
                    color: textColor),
                behaviorPosition: charts.BehaviorPosition.top,
                titleOutsideJustification:
                    charts.OutsideJustification.middleDrawArea,
              ),
              charts.PanAndZoomBehavior(),
            ],
            domainAxis: charts.OrdinalAxisSpec(
              viewport:
                  charts.OrdinalViewport("", seriesList.first.data.length),
              renderSpec: charts.SmallTickRendererSpec(
                // Tick and Label styling here.
                labelStyle: charts.TextStyleSpec(
                    fontSize: (h * 0.018).toInt(), // size in Pts.
                    color: textColor),

                // Change the line colors to match text color.
                lineStyle: charts.LineStyleSpec(color: textColor),
              ),
            ),

            // /// Assign a custom style for the measure axis.
            primaryMeasureAxis: charts.NumericAxisSpec(
              renderSpec: charts.GridlineRendererSpec(
                // Tick and Label styling here.
                labelStyle: charts.TextStyleSpec(
                    fontSize: (h * 0.018).toInt(), // size in Pts.
                    color: textColor),

                // Change the line colors to match text color.
                lineStyle: charts.LineStyleSpec(color: textColor),
              ),
            ),
            selectionModels: [
              charts.SelectionModelConfig(
                // type: charts.SelectionModelType.info,
                changedListener: (final model) {
                  cubit.changeBarChartText(model);
                },
              )
            ],
          );
        });
  }
}
