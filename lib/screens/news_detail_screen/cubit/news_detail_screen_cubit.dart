import 'package:bloc/bloc.dart';
import 'package:crypto_app/models/news_crypto/news_crypto.dart';
import 'package:crypto_app/public_providers/config/bloc_base_state.dart';
import 'package:crypto_app/public_providers/config/update_bloc_base_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:crypto_app/shared_customization/data/screen_value.dart';

import '../../../services/service_repositories/ai_reponsitory.dart';

part 'news_detail_screen_cubit.freezed.dart';
part 'news_detail_screen_state.dart';

class NewsDetailScreenCubit extends Cubit<NewsDetailScreenState> with UpdateBlocBaseState<NewsDetailScreenState> {
  NewsDetailScreenCubit() : super(const NewsDetailScreenState.initial(isLoading: false));

  final AiResponse _aiResponse = AiResponse();

  // Map language codes to full language names for AI prompt
  static const Map<String, String> _languageMap = {
    'en': 'English',
    'vi': 'Vietnamese',
    'ja': 'Japanese',
  };

  Future<void> evaluateNews(NewsCrypto news) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, aiEvaluation: null));

    try {
      // Determine the article's language, default to English if unknown
      final languageCode = news.language ?? 'en';
      final languageName = _languageMap[languageCode] ?? 'English';

      final prompt = '''
Evaluate the following news article for credibility and sentiment. Provide a brief summary of your findings in 2-3 sentences, including whether the article appears reliable and its overall tone (positive, negative, or neutral). Respond in $languageName to match the article's language.

Title: ${news.title ?? 'No Title'}
Description: ${news.description ?? 'No description available'}
Source: ${news.sourceName ?? 'Unknown Source'}
''';
      final response = await _aiResponse.getGeminiResponse(prompt);

      if (response != null) {
        emit(state.copyWith(
          isLoading: false,
          aiEvaluation: response,
          status: ScreenValue.success(),
        ));
      } else {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: 'Failed to get AI evaluation',
          status: ScreenValue.failed(),
        ));
      }
    } catch (e) {
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