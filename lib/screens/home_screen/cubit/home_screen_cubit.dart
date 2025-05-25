import 'package:bloc/bloc.dart';
import 'package:crypto_app/models/coin/coin_market.dart';
import 'package:crypto_app/public_providers/config/bloc_base_state.dart';
import 'package:crypto_app/public_providers/config/update_bloc_base_state.dart';
import 'package:crypto_app/services/service_repositories/coin_reponaitory.dart';
import 'package:crypto_app/shared_customization/extensions/api_page_response_ext.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app_common_data/common_data/global_variable.dart';
import '../../../models/exchange/exchange/exchange.dart';
import '../../../services/service_repositories/authentication_reponsitiory_firebase.dart';
import '../../../shared_customization/data/screen_value.dart';

part 'home_screen_cubit.freezed.dart';
part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> with UpdateBlocBaseState<HomeScreenState> {
  final AuthenticationRepositoryFirebase _authRepo = AuthenticationRepositoryFirebase();
  final CoinResponse _coinRepository = CoinResponse(apis: apis);

  HomeScreenCubit() : super(HomeScreenState.initial(isSearching: false));

  Future<void> loadData() async {
    await getListCoinMarket();
    await getListExchange();
    await getFavoriteCoins();
  }

  Future<void> getFavoriteCoins() async {
    try {
      final favoriteCoinIds = await _authRepo.getFavoriteCoinIds();
      print("DEBUG: Favorite coin IDs: $favoriteCoinIds");

      final favoriteCoins = state.listcoinMarket?.where((coin) => favoriteCoinIds.contains(coin.id)).toList() ?? [];

      emit(state.copyWith(favoriteCoins: favoriteCoins));
    } catch (e) {
      print("DEBUG: Error fetching favorite coins: $e");
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> addFavoriteCoin(String coinId) async {
    try {
      await _authRepo.addFavoriteCoin(coinId);
      await getFavoriteCoins();
    } catch (e) {
      print("DEBUG: Error adding favorite coin: $e");
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> removeFavoriteCoin(String coinId) async {
    try {
      await _authRepo.removeFavoriteCoin(coinId);
      await getFavoriteCoins();
    } catch (e) {
      print("DEBUG: Error removing favorite coin: $e");
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  void setSearchQuery(String query) {
    emit(state.copyWith(searchQuery: query, isSearching: query.isNotEmpty));
    if (query.isNotEmpty) {
      searchCoins(query);
    }
  }

  void searchCoins(String query) {
    if (query.isEmpty) {
      emit(state.copyWith(searchResults: null, isSearching: false));
      return;
    }

    if (state.listcoinMarket == null || state.listcoinMarket!.isEmpty) {
      emit(state.copyWith(searchResults: [], isSearching: true));
      return;
    }

    final results = state.listcoinMarket!.where((coin) {
      final name = (coin.name ?? '').toLowerCase();
      final symbol = (coin.symbol ?? '').toLowerCase();
      final queryLower = query.toLowerCase();
      return name.contains(queryLower) || symbol.contains(queryLower);
    }).toList();

    emit(state.copyWith(searchResults: results, isSearching: true));
  }

  void clearSearch() {
    emit(state.copyWith(searchQuery: '', searchResults: null, isSearching: false));
  }

  Future<void> getListExchange() async {
    try {
      final response = await _coinRepository.getListExchange();
      print("DEBUG: Exchange response: $response");

      if (response != null) {
        emit(state.copyWith(listExchange: response));
      } else {
        emit(state.copyWith(errorMessage: 'Exchange response is null'));
      }
    } catch (err) {
      print('DEBUG: Error calling getListExchange: $err');
      emit(state.copyWith(errorMessage: err.toString()));
    }
  }

  Future<void> getListCoinMarket() async {
    try {
      final response = await _coinRepository.getListCoinMarket();
      print("DEBUG: Coin market response: $response");

      if (response != null) {
        emit(state.copyWith(listcoinMarket: response));
        await getFavoriteCoins();
      } else {
        emit(state.copyWith(errorMessage: 'Coin market response is null'));
      }
    } catch (err) {
      print('DEBUG: Error calling getListCoinMarket: $err');
      emit(state.copyWith(errorMessage: err.toString()));
    }
  }

  @override
  void resetErrorMessage() => emit(state.copyWith(errorMessage: null));

  @override
  void resetStatus() => emit(state.copyWith(status: null));
}