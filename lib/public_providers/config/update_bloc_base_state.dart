import 'package:flutter_bloc/flutter_bloc.dart';

import '/public_providers/config/bloc_base_state.dart';

mixin UpdateBlocBaseState<S extends BlocBaseState> on Cubit<S> {
  void updateState(S Function(S state) onUpdate) => emit(onUpdate(state));
  void resetErrorMessage();
  void resetStatus();
}
