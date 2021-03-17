import 'package:equatable/equatable.dart';

class SequenceItem extends Equatable {
  final DateTime date;
  final double value;

  const SequenceItem(this.date, this.value);

  @override
  List<Object> get props => [date, value];
}
