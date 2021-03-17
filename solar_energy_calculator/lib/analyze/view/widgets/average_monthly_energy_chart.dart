import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_energy_calculator/analyze/cubit/analyze_cubit.dart';
import 'package:solar_energy_calculator/common/chart.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

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
          final lineColor = charts.ColorUtil.fromDartColor(
              theme.textTheme.bodyText1.color.withOpacity(0.3));
          return charts.BarChart(
            seriesList,
            animate: true,
            behaviors: [
              charts.ChartTitle(
                "Average Monthly Energy Output (kWh)",
                titleStyleSpec: charts.TextStyleSpec(
                    fontSize: (h * 0.02).toInt(), // size in Pts.
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
                lineStyle: charts.LineStyleSpec(color: lineColor),
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
                lineStyle: charts.LineStyleSpec(color: lineColor),
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
