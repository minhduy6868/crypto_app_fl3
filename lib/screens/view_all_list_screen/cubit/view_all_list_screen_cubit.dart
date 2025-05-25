import 'package:bloc/bloc.dart';
import 'package:crypto_app/models/coin/coin_market.dart';
import 'package:crypto_app/public_providers/config/bloc_base_state.dart';
import 'package:crypto_app/public_providers/config/update_bloc_base_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../app_common_data/common_data/global_variable.dart';
import '../../../models/exchange/exchange/exchange.dart';
import '../../../services/service_repositories/coin_reponaitory.dart';
import '../../../shared_customization/data/screen_value.dart';

part 'view_all_list_screen_cubit.freezed.dart';
part 'view_all_list_screen_state.dart';

class ViewAllListScreenCubit extends Cubit<ViewAllListScreenState> with UpdateBlocBaseState<ViewAllListScreenState> {
  ViewAllListScreenCubit() : super(ViewAllListScreenState.initial());

  final apiMusic = CoinResponse(apis: apis);

  Future<void> getListExchange() async {
    try {
      final response = await apiMusic.getListExchange();
      print("Exchange response: $response");

      if (response != null && response.isNotEmpty) {
        emit(state.copyWith(
          listExchange: response,
          filteredExchanges: response,
          errorMessage: null,
        ));
      } else {
        emit(state.copyWith(
          listExchange: [],
          filteredExchanges: [],
          errorMessage: 'Loading.............',
          status: ScreenValue.failed(),
        ));
      }
    } catch (err) {
      print('Error fetching exchanges: $err');
      emit(state.copyWith(
        errorMessage: err.toString(),
        status: ScreenValue.failed(),
      ));
    }
  }

  Future<void> getListCoinMarket() async {
    try {
      final response = await apiMusic.getListCoinMarket();
      print("Coin market response: $response");

      if (response != null && response.isNotEmpty) {
        emit(state.copyWith(
          listcoinMarket: response,
          filteredCoins: response,
          errorMessage: null,
        ));
      } else {
        emit(state.copyWith(
          listcoinMarket: [],
          filteredCoins: [],
          errorMessage: 'Loading......',
          status: ScreenValue.failed(),
        ));
      }
    } catch (err) {
      print('Error fetching coins: $err');
      emit(state.copyWith(
        errorMessage: err.toString(),
        status: ScreenValue.failed(),
      ));
    }
  }

  void setSearchQuery(String query) {
    final trimmedQuery = query.trim();
    emit(state.copyWith(searchQuery: trimmedQuery));
    _applyFilters(trimmedQuery, state.priceFilter);
  }

  void setPriceFilter(PriceFilter filter) {
    emit(state.copyWith(priceFilter: filter));
    _applyFilters(state.searchQuery, filter);
  }

  void _applyFilters(String query, PriceFilter priceFilter) {
    final lowercaseQuery = query.toLowerCase();

    if (state.listcoinMarket == null) {
      emit(state.copyWith(filteredCoins: [], filteredExchanges: state.listExchange ?? []));
      return;
    }

    // Lọc coin dựa trên tìm kiếm và giá
    List<CoinMarket> filteredCoins = state.listcoinMarket!;
    if (query.isNotEmpty) {
      filteredCoins = filteredCoins.where((coin) {
        final name = coin.name?.toLowerCase() ?? '';
        final symbol = coin.symbol?.toLowerCase() ?? '';
        return name.contains(lowercaseQuery) || symbol.contains(lowercaseQuery);
      }).toList();
    }

    // Lọc theo giá
    if (priceFilter != PriceFilter.all) {
      filteredCoins = filteredCoins.where((coin) {
        final priceChange = coin.priceChangePercentage24h ?? 0;
        return priceFilter == PriceFilter.increasing ? priceChange >= 0 : priceChange < 0;
      }).toList();
    }

    emit(state.copyWith(filteredCoins: filteredCoins));

    // Lọc exchange
    if (state.listExchange != null) {
      final filteredExchanges = query.isEmpty
          ? state.listExchange!
          : state.listExchange!.where((exchange) {
        final name = exchange.name?.toLowerCase() ?? '';
        final country = exchange.country?.toLowerCase() ?? '';
        return name.contains(lowercaseQuery) || country.contains(lowercaseQuery);
      }).toList();
      emit(state.copyWith(filteredExchanges: filteredExchanges));
    } else {
      emit(state.copyWith(filteredExchanges: []));
    }
  }

  @override
  void resetErrorMessage() => emit(state.copyWith(errorMessage: null));

  @override
  void resetStatus() => emit(state.copyWith(status: null));
}