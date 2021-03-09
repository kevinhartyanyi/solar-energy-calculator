import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class MyDialog extends StatelessWidget {
  const MyDialog(
      {Key key,
      @required this.height,
      @required this.width,
      this.backgroundColor,
      @required this.child})
      : super(key: key);
  final double height;
  final double width;
  final Color backgroundColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.themeOf(context).data;
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(10),
      child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: theme.primaryColor,
          ),
          padding: const EdgeInsets.all(20),
          child: child),
    );
  }
}
