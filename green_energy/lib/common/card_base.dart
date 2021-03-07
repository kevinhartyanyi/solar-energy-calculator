import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class CardBase extends StatelessWidget {
  const CardBase(
      {Key key, @required this.child, this.padding, this.height, this.width})
      : super(key: key);

  final Widget child;
  final EdgeInsets padding;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.themeOf(context).data;
    return Ink(
      height: height,
      width: width,
      padding: padding ?? EdgeInsets.fromLTRB(10, 2, 10, 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: theme.primaryColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            color: theme.shadowColor,
            blurRadius: 3,
          ),
        ],
      ),
      child: child,
    );
  }
}
