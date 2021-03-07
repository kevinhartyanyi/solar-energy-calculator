import 'package:flutter/material.dart';
import 'package:green_energy/common/my_text.dart';
import 'package:theme_provider/theme_provider.dart';

class MySwitch extends StatelessWidget {
  const MySwitch({
    Key key,
    @required this.texts,
    @required this.selected,
    @required this.onClick,
    this.textSize,
    this.selectColor,
  }) : super(key: key);

  final List<String> texts;
  final int selected;
  final double textSize;
  final Function(int) onClick;
  final Color selectColor;

  Color getColor(ThemeData theme) {
    return selectColor ?? theme.accentColor;
  }

  List<Widget> createButtons(ThemeData theme, double _textSize) {
    final List<Widget> buttons = [];
    for (var i = 0; i < texts.length; i++) {
      buttons.add(
        Expanded(
          child: GestureDetector(
            onTap: () {
              onClick(i);
            },
            child: Container(
              color: selected == i ? getColor(theme) : Colors.transparent,
              child: Align(
                  child: MyText(
                texts[i],
                textSize: _textSize,
                textColor: selected == i
                    ? theme.primaryColor
                    : theme.textTheme.bodyText1.color,
              )),
            ),
          ),
        ),
      );
    }
    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final theme = ThemeProvider.themeOf(context).data;
    final double _textSize = textSize ?? h * 0.03;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 3.0, color: getColor(theme)),
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            color: getColor(theme).withOpacity(0.1),
            blurRadius: 20,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Row(
          children: createButtons(theme, _textSize),
        ),
      ),
    );
  }
}
