import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_energy/analyze/cubit/analyze_cubit.dart';
import 'package:green_energy/common/my_textfield.dart';
import 'package:green_energy/strings.dart';
import 'package:green_energy/utils.dart';
import 'package:intl/intl.dart';

class Cost extends StatelessWidget {
  const Cost({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AnalyzeCubit>(context);
    return DoubleTextField(
        name: "Costs",
        currentValue: cubit.state.costs,
        onChanged: cubit.changeCosts,
        prefix: false,
        info: costInfo);
  }
}

class ElectricityPrice extends StatelessWidget {
  const ElectricityPrice({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AnalyzeCubit>(context);
    return DoubleTextField(
        name: "Electricity Price",
        currentValue: cubit.state.electricityPrice,
        onChanged: cubit.changeElectricityPricePrice,
        prefix: false,
        info: electricityPriceInfo);
  }
}

class Amount extends StatelessWidget {
  const Amount({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AnalyzeCubit>(context);
    return IntTextField(
      name: "Panel Amount",
      currentValue: cubit.state.amount,
      onChanged: cubit.changeAmount,
      prefix: false,
      info: amountInfo,
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
        final cubit = context.read<AnalyzeCubit>();
        datePicker(
            context: context,
            onPicked: cubit.changeEndDate,
            firstDate: cubit.state.instalment,
            initialDate: cubit.state.end,
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
            initialDate: cubit.state.instalment,
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
