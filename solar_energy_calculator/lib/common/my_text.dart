import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:theme_provider/theme_provider.dart';

class MyText extends StatelessWidget {
  const MyText(
    this.text, {
    Key key,
    this.textSize,
    this.textColor,
    this.maxlines = 1,
    this.strokeColor,
    this.bold = false,
    this.justify = false,
  }) : super(key: key);

  final String text;
  final double textSize;
  final Color textColor;
  final int maxlines;
  final Color strokeColor;
  final bool bold;
  final bool justify;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.themeOf(context).data;
    final h = MediaQuery.of(context).size.height;
    return AutoSizeText(
      text ?? "NULL TEXT",
      maxLines: maxlines,
      textAlign: justify ? TextAlign.justify : null,
      style: theme.textTheme.bodyText1.copyWith(
        color: textColor ?? theme.textTheme.bodyText1.color,
        fontWeight: bold ? FontWeight.w900 : FontWeight.normal,
        fontSize: textSize ?? h * 0.04,
      ),
    );
  }
}
