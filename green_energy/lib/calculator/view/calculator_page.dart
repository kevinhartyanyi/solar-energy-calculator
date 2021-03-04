import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_energy/calculator/cubit/calculator_cubit.dart';
import 'package:formz/formz.dart';
import 'package:green_energy/common/my_column.dart';
import 'package:green_energy/common/my_text.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFBF8F3),
      body: SafeArea(
        child: Material(
          child: BlocProvider(
            create: (context) => CalculatorCubit(),
            child: const Calculator(),
          ),
        ),
      ),
    );
  }
}

class Calculator extends StatelessWidget {
  const Calculator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CalculatorCubit>(context);
    return BlocListener<CalculatorCubit, CalculatorState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
        } else if (state.status.isSubmissionSuccess) {
          //context.navigator.pop();
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Success")),
            );
        }
      },
      child: MyColumn(
        children: [
          Expanded(child: SelectCalculatorType()),
          Expanded(
            child: InputDoubleButton(
              name: "Lat",
              onChanged: cubit.changeLatitude,
            ),
          ),
          Expanded(
            child: InputDoubleButton(
              name: "Lon",
              onChanged: cubit.changeLongitude,
            ),
          ),
          Expanded(child: SubmitButton()),
        ],
      ),
    );
  }
}

class SelectCalculatorType extends StatelessWidget {
  const SelectCalculatorType({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: MyText("Simple"),
    );
  }
}

class GeoMap extends StatelessWidget {
  const GeoMap({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MyText("Map"),
    );
  }
}

class InputDoubleButton extends StatelessWidget {
  const InputDoubleButton(
      {Key key, @required this.name, @required this.onChanged})
      : super(key: key);

  final String name;
  final Function(double) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: MyText(name)),
        const SizedBox(
          width: 8,
        ),
        Expanded(
            child: DoubleTextField(
          onChanged: onChanged,
        ))
      ],
    );
  }
}

class DoubleTextField extends StatelessWidget {
  const DoubleTextField({Key key, @required this.onChanged}) : super(key: key);

  final Function(double) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (text) {
        onChanged(double.parse(text));
      },
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'))
      ],
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final cubit = BlocProvider.of<CalculatorCubit>(context);
        //cubit.changeCoordinates(40, 30);
        cubit.submit();
      },
      child: Container(
        color: Colors.white,
        child: MyText("Calculate"),
      ),
    );
  }
}
