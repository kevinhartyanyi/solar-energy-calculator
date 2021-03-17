import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:solar_energy_calculator/common/my_text.dart';
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
    final infoTextSize = info.length > 200 ? h * 0.02 : h * 0.028;
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
          color: theme.textTheme.bodyText1.color.withOpacity(0.1),
        ),
        Expanded(
          child: Markdown(
            data: info,
            styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context))
                .copyWith(
                    listBullet: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontSize: infoTextSize,
                        color: theme.textTheme.bodyText1.color),
                    p: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontSize: infoTextSize,
                        color: theme.textTheme.bodyText1.color)),
          ),
        ),
        // Expanded(
        //   child: MyText(
        //     info,
        //     justify: true,
        //     maxlines: null,
        //     textSize: h * 0.03,
        //   ),
        // ),
      ],
    );
  }
}
