part of 'detail_exchange_screen_cubit.dart';



@freezed
class DetailExchangeScreenState with _$DetailExchangeScreenState, BlocBaseState{
  const factory DetailExchangeScreenState.initial({
    String? errorMessage,
    ScreenValue? status,
    Exchange? exchange,
    List<TickerExchange>? titketExchange,
  }) = _Initial;
}


