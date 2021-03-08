import 'package:flutter/material.dart';
import 'package:green_energy/common/card_base.dart';
import 'package:green_energy/common/my_text.dart';
import 'package:theme_provider/theme_provider.dart';

class DisplayValue extends StatelessWidget {
  const DisplayValue(
      {Key key,
      @required this.name,
      @required this.value,
      this.height,
      this.width,
      this.info})
      : super(key: key);

  final String name;
  final String value;
  final double height;
  final double width;
  final String info;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.themeOf(context).data;
    return CardBase(
      height: height,
      width: width,
      info: "info",
      child: Row(children: [
        Expanded(
          child: MyText(
            name,
            textColor: theme.accentColor,
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
            child: Align(
                child: MyText(
          value,
        )))
      ]),
    );
  }
}
