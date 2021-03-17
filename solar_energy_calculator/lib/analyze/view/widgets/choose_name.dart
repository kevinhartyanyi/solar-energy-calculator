import 'package:flutter/material.dart';
import 'package:solar_energy_calculator/common/card_base_button.dart';
import 'package:solar_energy_calculator/common/my_dialog.dart';
import 'package:solar_energy_calculator/common/my_text.dart';
import 'package:solar_energy_calculator/common/my_textfield.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:auto_route/auto_route.dart';

class ChooseName extends StatefulWidget {
  const ChooseName({
    Key key,
    @required this.currentName,
    @required this.onSave,
  }) : super(key: key);

  final String currentName;
  final Function(String) onSave;

  @override
  _ChooseNameState createState() => _ChooseNameState();
}

class _ChooseNameState extends State<ChooseName> {
  String name;

  @override
  void initState() {
    super.initState();
    name = widget.currentName;
  }

  void changeName(String text) {
    setState(() {
      name = text;
    });
  }

  Widget displayErrorMessage(ThemeData theme) {
    if (name.isEmpty) {
      return MyText(
        "Name can't be empty",
        textColor: theme.errorColor,
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  void onSubmitSave() {
    if (name.isEmpty) {
      return;
    }
    widget.onSave(name);
    //context.navigator.pop();
    context.navigator.popUntilRoot();
    //context.navigator.pushAndRemoveUntil(Routes.managePage, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final theme = ThemeProvider.themeOf(context).data;
    return MyDialog(
      width: w * 0.6,
      height: w * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const MyText(
            "Choose a name",
          ),
          Divider(
            color: theme.accentColor.withOpacity(0.3),
            thickness: 3.0,
            indent: w * 0.1,
            endIndent: w * 0.1,
          ),
          StringTextField(
            currentValue: name,
            name: "",
            onChanged: (text) => changeName(text),
          ),
          displayErrorMessage(theme),
          CardBaseButton(
            onTap: () {
              onSubmitSave();
            },
            text: "Save",
            bold: true,
            background: theme.backgroundColor,
          )
        ],
      ),
    );
  }
}
