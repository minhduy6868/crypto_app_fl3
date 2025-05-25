import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../public_providers/config/bloc_base_state.dart';
import '../../../public_providers/config/update_bloc_base_state.dart';
import '../../../shared_customization/data/screen_value.dart';
import '../../../shared_customization/helpers/utilizations/storages.dart';

part 'setting_screen_cubit.freezed.dart';
part 'setting_screen_state.dart';

class SettingScreenCubit extends Cubit<SettingScreenState>
    with UpdateBlocBaseState<SettingScreenState> {
  // List of supported locales
  static const List<Locale> supportedLocales = [
    Locale('en'),
    Locale('vi'),
    Locale('ja')
  ];

  VoidCallback? onLocaleChanged;

  SettingScreenCubit() : super(const SettingScreenState.initial());

  Future<void> loadCurrentLanguage(BuildContext context) async {
    emit(state.copyWith(isLoading: true));

    try {
      final sp = CustomSharedPreferences();
      await sp.init();

      final languageCode = sp.currentLanguage;
      final currentLocale = Locale(languageCode);

      emit(state.copyWith(
        locale: currentLocale,
        isLoading: false,
        status: ScreenValue.success(),
      ));

      if (context.mounted) {
        await context.setLocale(currentLocale);
      }
    } catch (e) {
      print("Error loading language: $e");
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'settings.language_load_error'.tr(),
        status: ScreenValue.failed(),
      ));
    }
  }

  Future<void> changeLocale(BuildContext context, Locale newLocale) async {
    if (!supportedLocales.contains(newLocale)) {
      emit(state.copyWith(
        errorMessage: 'settings.language_not_supported'.tr(),
        status: ScreenValue.failed(),
      ));
      return;
    }

    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final sp = CustomSharedPreferences();
      await sp.init();
      await sp.setCurrentLanguage(newLocale.languageCode);

      await context.setLocale(newLocale);

      // Notify listeners after successful change
      if (onLocaleChanged != null) {
        onLocaleChanged!();
      }

      emit(state.copyWith(
        locale: newLocale,
        isLoading: false,
        status: ScreenValue.success(),
      ));
    } catch (e) {
      print("Error changing language: $e");
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
        status: ScreenValue.failed(),
      ));
    }
  }

  @override
  void resetErrorMessage() => emit(state.copyWith(errorMessage: null));

  @override
  void resetStatus() => emit(state.copyWith(status: null));
}