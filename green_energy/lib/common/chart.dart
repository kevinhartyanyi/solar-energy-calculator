import 'package:flutter/material.dart';
import 'package:green_energy/common/my_text.dart';

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
