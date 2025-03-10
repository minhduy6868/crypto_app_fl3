import 'package:flutter/material.dart';

///
/// Update Text Style
///
typedef UpdateStyleCallBack = TextStyle Function(TextStyle style);

///
/// On tap to an item of a list
///
typedef OnItemTap<T> = void Function(T item);

///
/// Build widget form an item of a list
///
typedef ItemRenderCallBack<T> = Widget Function(T item);

///
/// Get identity of an item
///
typedef IdentifyCallBack<T> = String Function(T? item);

///
/// Validator for form field
///
typedef TypeValidation<T> = String? Function(T? data);

///
/// Build child widget from app form
///
typedef FormChildWidgetBuilder = Widget Function(GlobalKey<FormState> formKey);

///
/// Bloc base screen
///
typedef BlocBaseAsycnShowDialog<T> = Future<void> Function(
    BuildContext _, T state);
typedef BlocBaseOnShowDialogDone<T> = void Function(BuildContext _, T state);
typedef BlocBaseCreateCubit<T> = T Function(BuildContext _);
