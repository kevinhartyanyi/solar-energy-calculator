import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_size_text/auto_size_text.dart';

class MyText extends StatelessWidget {
  const MyText(
    this.text, {
    Key key,
    this.textSize,
    this.textColor,
    this.maxlines = 1,
    this.strokeColor,
  }) : super(key: key);

  final String text;
  final double textSize;
  final Color textColor;
  final int maxlines;
  final Color strokeColor;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return AutoSizeText(
      text ?? "NULL TEXT",
      maxLines: maxlines,
      // style: theme.text.copyWith(
      //   color: textColor ?? theme.defaultTextColor,
      //   fontWeight: FontWeight.w900,
      //   fontSize: textSize ?? h * 0.04,
      // ),
    );
  }
}
