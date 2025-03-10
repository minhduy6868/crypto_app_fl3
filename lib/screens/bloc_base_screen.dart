import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/shared_customization/extensions/list_ext.dart';
import '/generated/translations.g.dart';
import '/public_providers/config/bloc_base_state.dart';
import '/public_providers/config/update_bloc_base_state.dart';
import '/shared_customization/extensions/screen_value_ext.dart';
import '/shared_customization/helpers/dialogs/dialog_helper.dart';

// ignore: must_be_immutable
class BlocBaseScreen<B extends UpdateBlocBaseState<S>, S extends BlocBaseState>
    extends StatelessWidget {
  final B _cubit;
  final BlocWidgetBuilder<S> builder;
  final BlocBuilderCondition<S>? buildWhen;
  final List<BlocListener> listeners;
  final AsyncCallback? onShowError;
  final AsyncCallback? onShowSuccess;
  final void Function(BuildContext _, S state)? onShowErrorDone;
  final void Function(BuildContext _, S state)? onShowSuccessDone;
  final bool ignoreCubitInstance;
  List<BlocProvider> _providers = [];

  BlocBaseScreen({
    super.key,
    required B cubitInstance,
    required this.builder,
    this.buildWhen,
    this.listeners = const [],
    this.onShowError,
    this.onShowSuccess,
    this.onShowErrorDone,
    this.onShowSuccessDone,
    this.ignoreCubitInstance = false,
  }) : _cubit = cubitInstance;

  BlocBaseScreen.multiProvider({
    super.key,
    required List<BlocProvider> providers,
    required B cubitInstance,
    required this.builder,
    this.buildWhen,
    this.listeners = const [],
    this.onShowError,
    this.onShowSuccess,
    this.onShowErrorDone,
    this.onShowSuccessDone,
    this.ignoreCubitInstance = false,
  })  : _cubit = cubitInstance,
        _providers = providers;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        if (!ignoreCubitInstance) BlocProvider(create: (_) => _cubit),
        if (_providers.isNotEmptyOrNull) ..._providers
      ],
      child: Builder(builder: (context) {
        return MultiBlocListener(
          listeners: [
            BlocListener<B, S>(
              listenWhen: (previous, current) =>
                  previous.errorMessage != current.errorMessage &&
                  current.errorMessage != null,
              listener: (context, state) {
                (onShowError ??
                        () => showErrorDialog(context,
                            content: state.errorMessage))()
                    .then((_) {
                  _cubit.resetErrorMessage();
                  onShowErrorDone?.call(context, state);
                });
              },
            ),
            BlocListener<B, S>(
              listenWhen: (previous, current) =>
                  previous.status != current.status && current.status.isSuccess,
              listener: (context, state) {
                (onShowSuccess ??
                        () => showSuccessDialog(context,
                            content: tr(LocaleKeys
                                .CommonNotiAction_YourActionMakingSuccessfully)))()
                    .then((_) {
                  _cubit.resetStatus();
                  onShowSuccessDone?.call(context, state);
                });
              },
            ),
            if (listeners.isNotEmptyOrNull) ...listeners
          ],
          child: BlocBuilder<B, S>(
            buildWhen: buildWhen,
            bloc: _cubit,
            builder: (context, state) {
              return builder(context, state);
            },
          ),
        );
      }),
    );
  }
}
