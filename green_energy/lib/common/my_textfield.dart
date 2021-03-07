import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_energy/common/card_base.dart';
import 'package:green_energy/common/my_text.dart';
import 'package:green_energy/utils.dart';
import 'package:theme_provider/theme_provider.dart';

class IntTextField extends StatelessWidget {
  const IntTextField(
      {Key key,
      @required this.onChanged,
      @required this.currentValue,
      @required this.name})
      : super(key: key);

  final Function(int) onChanged;
  final int currentValue;
  final String name;

  void onTextChange(String text) {
    onChanged(int.parse(text));
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    controller.text = currentValue.toString();
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));
    final inputFormatters = [
      FilteringTextInputFormatter.digitsOnly,
    ];
    return MyTextField(
      name: name,
      onChanged: onTextChange,
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: inputFormatters,
    );
  }
}

class DoubleTextField extends StatelessWidget {
  const DoubleTextField(
      {Key key,
      @required this.onChanged,
      @required this.currentValue,
      @required this.name})
      : super(key: key);

  final Function(double) onChanged;
  final double currentValue;
  final String name;

  void onTextChange(String text) {
    onChanged(double.parse(text));
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    controller.text = roundAndRemoveTrailingZeros(currentValue, 3).toString();
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));
    final inputFormatters = [
      FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d{0,3})'))
    ];
    return MyTextField(
      name: name,
      onChanged: onTextChange,
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: inputFormatters,
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key key,
    @required this.name,
    @required this.onChanged,
    this.errorText,
    this.controller,
    this.keyboardType,
    this.inputFormatters,
    this.prefix = true,
  }) : super(key: key);

  final String name;
  final String errorText;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final TextEditingController controller;
  final void Function(String) onChanged;
  final bool prefix;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.themeOf(context).data;
    final h = MediaQuery.of(context).size.height;
    final double textSize = h * 0.03;
    return CardBase(
      child: Center(
        child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          cursorColor: theme.accentColor,
          style: theme.textTheme.bodyText1.copyWith(fontSize: h * 0.03),
          decoration: InputDecoration(
              prefix: prefix
                  ? TextFieldPrefix(text: name, textSize: textSize)
                  : null,
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.only(left: 15, bottom: 5, top: 5, right: 15),
              labelText: prefix ? null : name,
              labelStyle: TextStyle(color: theme.accentColor)),
        ),
      ),
    );
  }
}

class TextFieldPrefix extends StatelessWidget {
  const TextFieldPrefix({Key key, @required this.text, @required this.textSize})
      : super(key: key);

  final String text;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.themeOf(context).data;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Text(
        text,
        style: theme.textTheme.bodyText1.copyWith(
            fontSize: textSize,
            fontWeight: FontWeight.w900,
            color: theme.accentColor),
      ),
    );
  }
}
