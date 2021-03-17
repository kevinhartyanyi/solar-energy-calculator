import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_energy/calculator/cubit/calculator_cubit.dart';
import 'package:green_energy/common/card_base_button.dart';
import 'package:formz/formz.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key key}) : super(key: key);

  void onTap(BuildContext context) {
    BlocProvider.of<CalculatorCubit>(context).submit();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: BlocBuilder<CalculatorCubit, CalculatorState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return CardBaseButton(
            text: "Calculate",
            bold: true,
            isSubmissionInProgress: state.status.isSubmissionInProgress,
            onTap: () => onTap(context),
          );
        },
      ),
    );
  }
}
