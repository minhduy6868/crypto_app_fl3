import 'package:flutter_bloc/flutter_bloc.dart';

mixin UpdateState<S> on Cubit<S> {
  void updateState(S Function(S state) onUpdate) => emit(onUpdate(state));
}
