import 'package:equatable/equatable.dart';

class SumItem extends Equatable {
  final String name;
  final double amount;

  const SumItem(this.name, this.amount);

  @override
  List<Object> get props => [name, amount];
}
