import 'package:formz/formz.dart';

enum CoordValidationError { invalid }

class Coordinate extends FormzInput<double, CoordValidationError> {
  const Coordinate.pure() : super.pure(null);
  const Coordinate.dirty([double value = 0]) : super.dirty(value);

  @override
  CoordValidationError validator(double value) {
    return value == null ? CoordValidationError.invalid : null;
  }
}
