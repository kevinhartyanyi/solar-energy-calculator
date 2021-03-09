import 'package:flutter/material.dart';
import 'package:green_energy/common/my_text.dart';
import 'package:theme_provider/theme_provider.dart';

class Info extends StatelessWidget {
  const Info({Key key, @required this.info, @required this.name})
      : super(key: key);

  final String info;
  final String name;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.themeOf(context).data;
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;
    return Column(
      children: [
        MyText(
          name,
          bold: true,
          textColor: theme.accentColor,
        ),
        Divider(
          thickness: 3.0,
          indent: w * 0.1,
          endIndent: w * 0.1,
        ),
        Expanded(
          child: MyText(
            info,
            justify: true,
            maxlines: null,
            textSize: h * 0.03,
          ),
        ),
      ],
    );
  }
}
