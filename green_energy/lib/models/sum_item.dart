import 'package:equatable/equatable.dart';

class SumItem extends Equatable {
  final String name;
  double amount;

  SumItem(this.name, this.amount);

  @override
  List<Object> get props => [name, amount];
}
