part of 'view_all_list_screen_cubit.dart';

@freezed
class ViewAllListScreenState with _$ViewAllListScreenState, BlocBaseState{
  const factory ViewAllListScreenState.initial({
    String? errorMessage,
    ScreenValue? status,
    List<CoinMarket>? listcoinMarket,
    CoinMarket? coins,
    List<Exchange>? listExchange,
    Exchange? exchange
  }) = _Initial;
}


