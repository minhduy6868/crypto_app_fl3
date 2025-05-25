part of 'home_screen_cubit.dart';

@freezed
class HomeScreenState with _$HomeScreenState, BlocBaseState {
  const factory HomeScreenState.initial({
    String? errorMessage,
    ScreenValue? status,
    List<CoinMarket>? listcoinMarket,
    CoinMarket? coins,
    List<Exchange>? listExchange,
    Exchange? exchange,
    String? searchQuery,
    List<CoinMarket>? searchResults,
    bool? isSearching,
    List<CoinMarket>? favoriteCoins,
  }) = _Initial;
}