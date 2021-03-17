import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:solar_energy_calculator/constans.dart';
import 'package:solar_energy_calculator/models/calculation_item.dart';
import 'package:hive/hive.dart';
import 'package:logging/logging.dart';

class ManageCubit extends Cubit<List<CalculationItem>> {
  ManageCubit() : super([]) {
    box = Hive.box(calculationsBox);
    boxSubscription = box.watch().listen((event) {
      return boxChanged();
    });
    boxChanged();
  }

  static final _log = Logger("ManageCubit");

  Box<CalculationItem> box;
  StreamSubscription<BoxEvent> boxSubscription;

  void boxChanged() {
    final values = box.values.toList();
    _log.fine("$calculationsBox box changed to $values");
    emit(values);
  }

  @override
  Future<void> close() {
    boxSubscription?.cancel();
    return super.close();
  }
}
