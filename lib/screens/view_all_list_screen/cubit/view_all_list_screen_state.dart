part of 'view_all_list_screen_cubit.dart';

enum PriceFilter { all, increasing, decreasing }

@freezed
class ViewAllListScreenState with _$ViewAllListScreenState, BlocBaseState {
  const factory ViewAllListScreenState.initial({
    String? errorMessage,
    ScreenValue? status,
    List<CoinMarket>? listcoinMarket,
    CoinMarket? coins,
    List<Exchange>? listExchange,
    Exchange? exchange,
    @Default([]) List<CoinMarket> filteredCoins,
    @Default([]) List<Exchange> filteredExchanges,
    @Default('') String searchQuery,
    @Default(PriceFilter.all) PriceFilter priceFilter,
  }) = _Initial;
}