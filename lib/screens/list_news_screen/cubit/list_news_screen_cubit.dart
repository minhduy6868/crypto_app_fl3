// list_news_screen_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:crypto_app/public_providers/config/bloc_base_state.dart';
import 'package:crypto_app/public_providers/config/update_bloc_base_state.dart';
import 'package:crypto_app/services/service_repositories/news_reponsitory.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app_common_data/common_data/global_variable.dart';
import '../../../models/news_crypto/news_crypto.dart';
import '../../../services/apis/api_client.dart';
import '../../../shared_customization/data/screen_value.dart';
import '../../../shared_customization/helpers/utilizations/storages.dart';

part 'list_news_screen_cubit.freezed.dart';
part 'list_news_screen_state.dart';

class ListNewsScreenCubit extends Cubit<ListNewsScreenState> with UpdateBlocBaseState<ListNewsScreenState> {
  ListNewsScreenCubit() : super(const ListNewsScreenState.initial(isLoading: false));

  final newsRepo = NewsReponsitory(apinews: apinews);

  static const Map<String, String> _languageMap = {
    'vi': 'vi',
    'en': 'en',
    'ja': 'jp',
  };

  Future<void> fetchNews({String? category}) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, selectedCategory: category));

    final sp = CustomSharedPreferences();
    await sp.init();

    final languageCode = sp.currentLanguage ?? 'vi';
    final apiLanguageCode = _languageMap[languageCode] ?? 'vi';

    print('Fetching news with language: $apiLanguageCode, category: $category');

    try {
      final newsList = await newsRepo.getListNews(apiLanguageCode, category);
      print('News fetched: $newsList');
      emit(state.copyWith(
        isLoading: false,
        newsList: newsList,
        status: ScreenValue.success(),
      ));
    } catch (e) {
      print('Error fetching news: $e');
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