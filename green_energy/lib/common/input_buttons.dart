// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:green_energy/common/my_text.dart';
// import 'package:green_energy/utils.dart';

// class InputIntButton extends StatelessWidget {
//   const InputIntButton(
//       {Key key,
//       @required this.name,
//       @required this.onChanged,
//       @required this.currentValue})
//       : super(key: key);

//   final String name;
//   final int currentValue;
//   final Function(int) onChanged;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(child: MyText(name)),
//         const SizedBox(
//           width: 8,
//         ),
//         Expanded(
//             child: IntTextField(
//           currentValue: currentValue,
//           onChanged: onChanged,
//         ))
//       ],
//     );
//   }
// }

// class InputDoubleButton extends StatelessWidget {
//   const InputDoubleButton(
//       {Key key,
//       @required this.name,
//       @required this.onChanged,
//       @required this.currentValue})
//       : super(key: key);

//   final String name;
//   final double currentValue;
//   final Function(double) onChanged;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(child: MyText(name)),
//         const SizedBox(
//           width: 8,
//         ),
//         Expanded(
//             child: DoubleTextField(
//           currentValue: currentValue,
//           onChanged: onChanged,
//         ))
//       ],
//     );
//   }
// }

// class IntTextField extends StatelessWidget {
//   const IntTextField(
//       {Key key, @required this.onChanged, @required this.currentValue})
//       : super(key: key);

//   final Function(int) onChanged;
//   final int currentValue;

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController controller = TextEditingController();
//     controller.text = currentValue.toString();
//     controller.selection = TextSelection.fromPosition(
//         TextPosition(offset: controller.text.length));
//     return TextField(
//       onChanged: (text) {
//         onChanged(int.parse(text));
//       },
//       controller: controller,
//       keyboardType: TextInputType.number,
//       inputFormatters: [
//         FilteringTextInputFormatter.digitsOnly,
//       ],
//     );
//   }
// }

// class DoubleTextField extends StatelessWidget {
//   const DoubleTextField(
//       {Key key, @required this.onChanged, @required this.currentValue})
//       : super(key: key);

//   final Function(double) onChanged;
//   final double currentValue;

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController controller = TextEditingController();
//     controller.text = roundAndRemoveTrailingZeros(currentValue, 3).toString();
//     controller.selection = TextSelection.fromPosition(
//         TextPosition(offset: controller.text.length));
//     return TextField(
//       onChanged: (text) {
//         onChanged(double.parse(text));
//       },
//       controller: controller,
//       keyboardType: TextInputType.number,
//       inputFormatters: [
//         FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d{0,3})'))
//       ],
//     );
//   }
// }
