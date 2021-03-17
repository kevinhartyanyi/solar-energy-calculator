import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class ListDivider extends StatelessWidget {
  const ListDivider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final theme = ThemeProvider.themeOf(context).data;
    return Divider(
      color: theme.accentColor.withOpacity(0.3),
      thickness: 3.0,
      indent: w * 0.1,
      endIndent: w * 0.1,
    );
  }
}
