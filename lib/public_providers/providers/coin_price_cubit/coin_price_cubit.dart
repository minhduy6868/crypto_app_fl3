import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'coin_price_state.dart';
part 'coin_price_cubit.freezed.dart';

class CoinPriceCubit extends Cubit<CoinPriceState> {
  CoinPriceCubit() : super(const CoinPriceState.initial());

  final Map<String, WebSocketChannel> _channels = {};
  final Map<String, StreamSubscription> _subscriptions = {};
  final websocketUrl = dotenv.env['webSocketUrl']!;

  void subscribeToCoin(String symbol) {
    // Chuyển symbol thành định dạng phù hợp (ví dụ: BTC -> btcusdt)
    final normalizedSymbol = '${symbol.toLowerCase()}usdt@ticker';
    if (_channels.containsKey(symbol)) return;

    try {
      final channel = WebSocketChannel.connect(
        Uri.parse('$websocketUrl$normalizedSymbol'),
      );
      print("in rkeesket noi socket: $channel");

      _channels[symbol] = channel;

      _subscriptions[symbol] = channel.stream.listen(
            (data) {
          try {
            final jsonData = json.decode(data);
            final currentPrice = jsonData['c']?.toString() ?? '0';
            final priceChangePercent = jsonData['P']?.toString() ?? '0';

            print("in ra data $jsonData");
            emit(CoinPriceState.priceUpdated(
              symbol: symbol,
              price: currentPrice,
              changePercent: priceChangePercent,
            ));
          } catch (e) {
            emit(CoinPriceState.error('Failed to parse price data for $symbol: $e'));
          }
        },
        onError: (error) {
          emit(CoinPriceState.error('WebSocket error for $symbol: $error'));
          _reconnect(symbol); // Thử kết nối lại khi có lỗi
        },
        onDone: () {
          emit(CoinPriceState.error('WebSocket closed for $symbol'));
          _reconnect(symbol); // Thử kết nối lại khi kênh đóng
        },
      );
    } catch (e) {
      emit(CoinPriceState.error('Failed to connect WebSocket for $symbol: $e'));
    }
  }

  void unsubscribeFromCoin(String symbol) {
    _subscriptions[symbol]?.cancel();
    _channels[symbol]?.sink.close();
    _subscriptions.remove(symbol);
    _channels.remove(symbol);
  }

  void _reconnect(String symbol) {
    // Hủy kết nối hiện tại
    unsubscribeFromCoin(symbol);
    // Thử kết nối lại sau 5 giây
    Future.delayed(const Duration(seconds: 5), () {
      subscribeToCoin(symbol);
    });
  }

  @override
  Future<void> close() async {
    for (final subscription in _subscriptions.values) {
      await subscription.cancel();
    }
    for (final channel in _channels.values) {
      await channel.sink.close();
    }
    _subscriptions.clear();
    _channels.clear();
    return super.close();
  }
}