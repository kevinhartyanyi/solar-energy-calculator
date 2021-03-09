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
        TmpChart(),
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
