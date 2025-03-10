import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'page_router_state.dart';
part 'page_router_cubit.freezed.dart';

class PageRouterCubit extends Cubit<PageRouterState> {
  PageRouterCubit() : super(const PageRouterState.initial());

  void updatePage({required String? name, dynamic args}) {
    debugPrint('DEBUG: ===> Navigate to page $name\nArgument: $args');
    emit(state.copyWith(
        previousPageName: state.currentPageName,
        previousPageArgs: state.currentPageArgs,
        currentPageName: name,
        currentPageArgs: args));
  }
}
