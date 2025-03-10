import 'package:crypto_app/shared_customization/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';
import 'package:crypto_app/shared_customization/widgets/custom_widgets/app_dismiss_keyboard.dart';
import 'package:crypto_app/screens/bloc_base_screen.dart';
import 'package:crypto_app/screens/view_all_list_screen/cubit/view_all_list_screen_cubit.dart';

import '../../app_common_data/routes/app_routes.dart';
import '../detail_coin_screen/detail_coin_screen.dart';

class ViewAllListScreen extends StatelessWidget {
  final bool isExchange;

  const ViewAllListScreen({super.key, required this.isExchange});

  @override
  Widget build(BuildContext context) {
    final cubit;
    if(isExchange) {
      cubit = ViewAllListScreenCubit()..getListExchange();
    } else {
      cubit = ViewAllListScreenCubit()..getListCoinMarket();
    }
    return BlocBaseScreen<ViewAllListScreenCubit, ViewAllListScreenState>(
      cubitInstance: cubit,
      builder: (context, state) {
        return AppDismissKeyboard(
          child: Scaffold(
            appBar: AppBar(
              title: Text(isExchange ? "Exchanges" : "Coins"),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildContent(context, state),
            ),
          ),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, ViewAllListScreenState state) {
    if (isExchange) {
      return _buildExchangeList(state);
    } else {
      return _buildCoinMarketList(state);
    }
  }

  Widget _buildCoinMarketList(ViewAllListScreenState state) {
    if (state.listcoinMarket == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.errorMessage != null) {
      return Center(
        child: Text(
          state.errorMessage ?? 'An error occurred',
          style: const TextStyle(color: Colors.red),
        ),
      );
    }

    final coins = state.listcoinMarket ?? [];

    if (coins.isEmpty) {
      return const Center(child: Text('No coins available'));
    }

    return ListView.builder(
      itemCount: coins.length,
      itemBuilder: (context, index) {
        final coin = coins[index];
        return GestureDetector(
          onTap: () {
            context.pushNamed(
              Routes.detailCoinScreen,
              arguments: DetailCoinScreenArgs(coinId: coin.id ?? ""),
            );
          },
          child: _buildCoinItem(coin),
        );
      },
    );
  }

  Widget _buildExchangeList(ViewAllListScreenState state) {
    if (state.listExchange == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.errorMessage != null) {
      return Center(
        child: Text(
          state.errorMessage ?? 'An error occurred',
          style: const TextStyle(color: Colors.red),
        ),
      );
    }

    final exchanges = state.listExchange ?? [];

    if (exchanges.isEmpty) {
      return const Center(child: Text('No exchanges available'));
    }

    return ListView.builder(
      itemCount: exchanges.length,
      itemBuilder: (context, index) {
        final exchange = exchanges[index];
        return _buildExchangeItem(exchange);
      },
    );
  }

  Widget _buildCoinItem(dynamic coin) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.network(
            coin.image ?? 'https://via.placeholder.com/50',
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coin.name ?? 'No Name Available',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  coin.symbol ?? 'No Symbol',
                  style: const TextStyle(color: Colors.grey),
                ),
                Text(
                  '\$${coin.currentPrice?.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExchangeItem(dynamic exchange) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.network(
            exchange.image ?? 'https://via.placeholder.com/50',
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exchange.name ?? 'No Name Available',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  exchange.country ?? 'No Country',
                  style: const TextStyle(color: Colors.grey),
                ),
                Text(
                  '24h Volume: \$${exchange.tradeVolume24hBtc?.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
