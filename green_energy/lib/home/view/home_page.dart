import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_energy/common/card_base.dart';
import 'package:green_energy/common/my_column.dart';
import 'package:green_energy/common/my_text.dart';
import 'package:green_energy/home/cubit/home_cubit.dart';
import 'package:green_energy/utils.dart';
import 'package:theme_provider/theme_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.themeOf(context).data;
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
        child: Material(
          color: Colors.transparent,
          child: BlocProvider(
            create: (context) => HomeCubit(),
            child: const Home(),
          ),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return const MyColumn(
      children: [
        Expanded(child: ThisMonth()),
        SizedBox(
          height: 16.0,
        ),
        Expanded(child: Lifetime()),
      ],
    );
  }
}

class ThisMonth extends StatelessWidget {
  const ThisMonth({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Block(
        title: "This Month",
        energyOutput: 3050,
        co2Reduction: 1.1,
        moneySaved: 15);
  }
}

class Lifetime extends StatelessWidget {
  const Lifetime({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Block(
        title: "Lifetime",
        energyOutput: 3050,
        co2Reduction: 1.1,
        moneySaved: 15);
  }
}

class Block extends StatelessWidget {
  const Block({
    Key key,
    @required this.title,
    @required this.energyOutput,
    @required this.co2Reduction,
    @required this.moneySaved,
  }) : super(key: key);

  final String title;
  final double energyOutput;
  final double co2Reduction;
  final double moneySaved;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.themeOf(context).data;
    return Column(
      children: [
        MyText(
          title,
          textColor: theme.textTheme.bodyText1.color.withOpacity(0.3),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Expanded(
          child: EnergyOutput(
            energy: energyOutput,
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Expanded(
            child: DisplayData(
          co2Reduction: co2Reduction,
          moneySaved: moneySaved,
        )),
        const SizedBox(
          height: 8.0,
        ),
      ],
    );
  }
}

class EnergyOutput extends StatelessWidget {
  const EnergyOutput({
    Key key,
    @required this.energy,
  }) : super(key: key);

  final double energy;

  @override
  Widget build(BuildContext context) {
    final String energyFormatted = formatTotalEnergy(energy);
    return HomeItem(
      title: "Energy Output",
      content: energyFormatted,
      header: true,
    );
  }
}

class DisplayData extends StatelessWidget {
  const DisplayData({
    Key key,
    @required this.moneySaved,
    @required this.co2Reduction,
  }) : super(key: key);

  final double moneySaved;
  final double co2Reduction;

  @override
  Widget build(BuildContext context) {
    final String co2Formatted = formatCO2Reduction(co2Reduction);
    return Row(
      children: [
        Expanded(
          child: HomeItem(
            title: "Saved",
            content: "$moneySaved \$",
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: HomeItem(
            title: "CO2 Reduction",
            content: co2Formatted,
          ),
        ),
      ],
    );
  }
}

class HomeItem extends StatelessWidget {
  const HomeItem({
    Key key,
    @required this.title,
    @required this.content,
    this.height,
    this.width,
    this.header = false,
  }) : super(key: key);

  final String title;
  final String content;
  final double height;
  final double width;
  final bool header;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.themeOf(context).data;
    final h = MediaQuery.of(context).size.height;
    final titleColor = header
        ? theme.accentColor
        : theme.textTheme.bodyText1.color.withOpacity(0.3);
    return CardBase(
      width: double.infinity,
      // height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment:
            header ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          MyText(
            title,
            textColor: titleColor,
            textSize: header ? h * 0.05 : h * 0.04,
          ),
          MyText(
            content,
            bold: !header,
            textSize: header ? h * 0.04 : h * 0.03,
          ),
        ],
      ),
    );
  }
}
