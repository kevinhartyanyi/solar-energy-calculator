import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:green_energy/constans.dart';
import 'package:green_energy/models/calculation_item.dart';
import 'package:hive/hive.dart';
import 'package:logging/logging.dart';

class HomeCubit extends Cubit<List<int>> {
  HomeCubit() : super([]) {
    calcBox = Hive.box(calculationsBox);
    selectBox = Hive.box(selectedBox);
    boxSubscription = selectBox.watch().listen((event) {
      return boxChanged();
    });
    boxChanged();
  }

  static final _log = Logger("HomeCubit");

  Box<CalculationItem> selectBox;
  Box<CalculationItem> calcBox;
  StreamSubscription<BoxEvent> boxSubscription;

  void boxChanged() {
    final values = selectBox.values.map((e) => e.key as int).toList();
    _log.fine("$selectBox box changed, updating HomeCubit");
    emit(values);
  }

  @override
  Future<void> close() {
    boxSubscription?.cancel();
    return super.close();
  }
}
