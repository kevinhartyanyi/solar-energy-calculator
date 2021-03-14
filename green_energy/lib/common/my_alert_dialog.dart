import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({
    Key key,
    @required this.backgroundColor,
    @required this.confirmText,
    @required this.description,
    @required this.continueColor,
    @required this.onConfirm,
  }) : super(key: key);

  final Color backgroundColor;
  final String confirmText;
  final String description;
  final Color continueColor;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.themeOf(context).data;
    // set up the buttons
    final Widget cancelButton = TextButton(
      onPressed: () {
        context.rootNavigator.pop();
      },
      child: const Text(
        "Cancel",
      ),
    );
    final Widget continueButton = TextButton(
      onPressed: () {
        context.rootNavigator.pop();
        onConfirm();
      },
      child: Text(
        "Continue",
        style: theme.textTheme.bodyText1.copyWith(color: continueColor),
      ),
    );
    return AlertDialog(
      backgroundColor: backgroundColor,
      title: Text(
        confirmText,
        style: theme.textTheme.bodyText1
            .copyWith(fontWeight: FontWeight.bold, color: continueColor),
      ),
      content: Text(
        description,
        style: theme.textTheme.bodyText1,
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
  }
}
