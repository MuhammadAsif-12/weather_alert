import 'package:flutter_bloc/flutter_bloc.dart';

extension SafeEmitExtension<Event, State> on Bloc<Event, State> {
  void safeEmit(State state) {
    if (!isClosed) {
      emit(state);
    }
  }
}