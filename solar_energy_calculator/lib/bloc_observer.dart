import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

class GlobalCubitObserver extends BlocObserver {
  static final _log = Logger("GlobalCubitObserver");

  @override
  void onCreate(Cubit cubit) {
    super.onCreate(cubit);
    _log.finest('onCreate -- cubit: ${cubit.runtimeType}');
  }

  @override
  void onChange(Cubit cubit, Change change) {
    super.onChange(cubit, change);
    _log.finest('onChange -- cubit: ${cubit.runtimeType}, change: $change');
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    _log.finest('onError -- cubit: ${cubit.runtimeType}, error: $error');
    super.onError(cubit, error, stackTrace);
  }

  @override
  void onClose(Cubit cubit) {
    super.onClose(cubit);
    _log.finest('onClose -- cubit: ${cubit.runtimeType}');
  }
}
