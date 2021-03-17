import 'package:flutter/material.dart';
import 'package:solar_energy_calculator/common/card_base.dart';
import 'package:solar_energy_calculator/common/my_text.dart';
import 'package:theme_provider/theme_provider.dart';

class CardBaseButton extends StatelessWidget {
  const CardBaseButton({
    Key key,
    @required this.onTap,
    @required this.text,
    this.bold = false,
    this.isSubmissionInProgress = false,
    this.background,
    this.textSize,
  }) : super(key: key);

  final bool isSubmissionInProgress;
  final VoidCallback onTap;
  final String text;
  final bool bold;
  final Color background;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.themeOf(context).data;
    return isSubmissionInProgress
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : InkWell(
            onTap: () {
              onTap();
            },
            child: CardBase(
              background: background,
              child: Center(
                child: MyText(
                  text,
                  textSize: textSize,
                  bold: bold,
                  textColor: theme.accentColor,
                ),
              ),
            ),
          );
  }
}
