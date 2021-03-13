import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_energy/analyze/cubit/analyze_cubit.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:green_energy/common/chart.dart';
import 'package:theme_provider/theme_provider.dart';

class MoneySavedChart extends StatelessWidget {
  const MoneySavedChart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return BlocBuilder<AnalyzeCubit, AnalyzeState>(
      buildWhen: (previous, current) =>
          previous.areaChartText != current.areaChartText,
      builder: (context, state) {
        return SizedBox(
          height: h * 0.5,
          child: Chart(
            chart: const LineAreaChart(),
            bottomText: state.areaChartText,
          ),
        );
      },
    );
  }
}

class LineAreaChart extends StatelessWidget {
  const LineAreaChart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalyzeCubit, AnalyzeState>(
        buildWhen: (previous, current) =>
            previous.solarData != current.solarData ||
            previous.electricityPrice != current.electricityPrice ||
            previous.instalment != current.instalment ||
            previous.end != current.end,
        builder: (context, state) {
          final h = MediaQuery.of(context).size.height;
          final cubit = BlocProvider.of<AnalyzeCubit>(context);
          final theme = ThemeProvider.themeOf(context).data;
          final seriesList = cubit.getSequenceTimes("LineAreaChart", theme);
          final Locale myLocale = Localizations.localeOf(context);
          final textColor =
              charts.ColorUtil.fromDartColor(theme.textTheme.bodyText1.color);
          final lineColor = charts.ColorUtil.fromDartColor(
              theme.textTheme.bodyText1.color.withOpacity(0.3));
          final viewPortStart = DateTime(state.instalment.year,
              state.instalment.month, state.instalment.day);
          final viewPortEnd =
              DateTime(state.end.year, state.end.month, state.end.day);
          return charts.TimeSeriesChart(
            seriesList,
            defaultRenderer:
                charts.LineRendererConfig(includeArea: true, stacked: true),
            animate: true,
            domainAxis: charts.DateTimeAxisSpec(
              viewport: charts.DateTimeExtents(
                  start: viewPortStart, end: viewPortEnd),
              renderSpec: charts.SmallTickRendererSpec(
                // Tick and Label styling here.
                labelStyle: charts.TextStyleSpec(
                    fontSize: (h * 0.016).toInt(), // size in Pts.
                    color: textColor),
                // Change the line colors to match text color.
                lineStyle: charts.LineStyleSpec(color: textColor),
              ),
            ),

            /// Assign a custom style for the measure axis.
            primaryMeasureAxis: charts.NumericAxisSpec(
              renderSpec: charts.GridlineRendererSpec(
                // Tick and Label styling here.
                labelStyle: charts.TextStyleSpec(
                    fontSize: (h * 0.016).toInt(), // size in Pts.
                    color: textColor),

                // Change the line colors to match text color.
                lineStyle: charts.LineStyleSpec(color: lineColor),
              ),
            ),
            behaviors: [
              charts.ChartTitle(
                "Estimated Money Saved",
                titleStyleSpec: charts.TextStyleSpec(
                    fontSize: (h * 0.02).toInt(), // size in Pts.
                    color: textColor),
                behaviorPosition: charts.BehaviorPosition.top,
                titleOutsideJustification:
                    charts.OutsideJustification.middleDrawArea,
              ),
              charts.PanAndZoomBehavior(),
            ],
            selectionModels: [
              charts.SelectionModelConfig(
                // type: charts.SelectionModelType.info,
                changedListener: (final model) {
                  cubit.changeAreaChartText(model, myLocale);
                },
              )
            ],
          );
        });
  }
}
