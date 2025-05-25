import 'package:crypto_app/public_providers/providers/coin_price_cubit/coin_price_cubit.dart';
import 'package:crypto_app/shared_customization/data/screen_value.dart';
import 'package:crypto_app/shared_customization/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';
import 'package:crypto_app/shared_customization/widgets/custom_widgets/app_dismiss_keyboard.dart';
import 'package:crypto_app/screens/bloc_base_screen.dart';
import 'package:crypto_app/screens/view_all_list_screen/cubit/view_all_list_screen_cubit.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import '../../app_common_data/app_colors.dart';
import '../../app_common_data/app_text_sytle.dart';
import '../../app_common_data/routes/app_routes.dart';
import '../detail_coin_screen/detail_coin_screen.dart';
import '../detail_exchange_screen/detail_exchange_screen.dart';

class ViewAllListScreen extends StatefulWidget {
  final bool isExchange;

  const ViewAllListScreen({super.key, required this.isExchange});

  @override
  State<ViewAllListScreen> createState() => _ViewAllListScreenState();
}

class _ViewAllListScreenState extends State<ViewAllListScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  late ViewAllListScreenCubit _cubit;
  final Set<String> _subscribedSymbols = {};

  @override
  void initState() {
    super.initState();
    _cubit = ViewAllListScreenCubit();
    if (widget.isExchange) {
      _cubit.getListExchange();
    } else {
      _cubit.getListCoinMarket();
    }
  }

  @override
  void dispose() {
    final coinPriceCubit = context.read<CoinPriceCubit>();
    for (var symbol in _subscribedSymbols) {
      coinPriceCubit.unsubscribeFromCoin(symbol);
    }
    _subscribedSymbols.clear();
    _searchController.dispose();
    _searchFocusNode.dispose();
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ViewAllListScreenCubit>(
      create: (context) => _cubit,
      child: BlocBaseScreen<ViewAllListScreenCubit, ViewAllListScreenState>(
        cubitInstance: _cubit,
        builder: (context, state) {
          // Handle coin subscription for real-time updates
          if (!widget.isExchange && state.filteredCoins.isNotEmpty) {
            final coinPriceCubit = context.read<CoinPriceCubit>();
            for (var coin in state.filteredCoins) {
              final symbol = coin.symbol?.toUpperCase() ?? '';
              if (symbol.isNotEmpty && !_subscribedSymbols.contains(symbol)) {
                coinPriceCubit.subscribeToCoin(symbol);
                _subscribedSymbols.add(symbol);
              }
            }
          }

          return AppDismissKeyboard(
            child: Scaffold(
              backgroundColor: Colors.grey[100],
              appBar: AppBar(
                title: Text(
                  widget.isExchange ? "Exchanges" : "Coins",
                  style: AppTextStyle.titleText.copyWith(fontSize: 18),
                ),
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.grey[100],
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: _buildSearchBar(context, _cubit),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: _buildContent(context, state),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context, ViewAllListScreenCubit cubit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.08),
                blurRadius: 6,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: TextField(
            controller: _searchController,
            focusNode: _searchFocusNode,
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              hintText: widget.isExchange ? 'Search exchanges...' : 'Search coins...',
              hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
              prefixIcon: Icon(Icons.search, color: Colors.grey[400], size: 20),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                icon: Icon(Icons.clear, color: Colors.grey[400], size: 18),
                onPressed: () {
                  _searchController.clear();
                  cubit.setSearchQuery('');
                  _searchFocusNode.unfocus();
                },
              )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
            ),
            onChanged: (value) {
              cubit.setSearchQuery(value);
            },
          ),
        ),
        if (!widget.isExchange) ...[
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterChip(context, cubit, 'All', PriceFilter.all),
                const SizedBox(width: 8),
                _buildFilterChip(context, cubit, 'Increasing', PriceFilter.increasing),
                const SizedBox(width: 8),
                _buildFilterChip(context, cubit, 'Decreasing', PriceFilter.decreasing),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildFilterChip(
      BuildContext context, ViewAllListScreenCubit cubit, String label, PriceFilter filter) {
    final isSelected = cubit.state.priceFilter == filter;
    return GestureDetector(
      onTap: () => cubit.setPriceFilter(filter),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Theme.of(context).primaryColor : Colors.grey[300]!,
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, ViewAllListScreenState state) {
    if (widget.isExchange) {
      return _buildExchangeList(state);
    } else {
      return _buildCoinMarketList(state);
    }
  }

  Widget _buildCoinMarketList(ViewAllListScreenState state) {
    if (state.errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 40, color: Colors.red[400]),
            const SizedBox(height: 8),
            Text(
              state.errorMessage!,
              style: TextStyle(color: Colors.red[400], fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    final coins = state.filteredCoins;

    if (coins.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 50, color: Colors.grey[400]),
            const SizedBox(height: 12),
            Text(
              state.searchQuery.isNotEmpty
                  ? 'No coins found for "${state.searchQuery}"'
                  : 'Loading...',
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
          ],
        ),
      );
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
    if (state.errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 40, color: Colors.red[400]),
            const SizedBox(height: 8),
            Text(
              state.errorMessage!,
              style: TextStyle(color: Colors.red[400], fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    final exchanges = state.filteredExchanges;

    if (exchanges.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 50, color: Colors.grey[400]),
            const SizedBox(height: 12),
            Text(
              state.searchQuery.isNotEmpty
                  ? 'No exchanges found for "${state.searchQuery}"'
                  : 'Loading...',
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: exchanges.length,
      itemBuilder: (context, index) {
        final exchange = exchanges[index];
        return GestureDetector(
          onTap: () {
            context.pushNamed(
              Routes.detailExchangeScreen,
              arguments: DetailExchangeScreenArgs(exchangeId: exchange.id ?? ""),
            );
          },
          child: _buildExchangeItem(exchange),
        );
      },
    );
  }

  Widget _buildCoinItem(dynamic coin) {
    final symbol = coin.symbol?.toUpperCase() ?? '';

    return BlocBuilder<CoinPriceCubit, CoinPriceState>(
      buildWhen: (previous, current) {
        return current.maybeWhen(
          priceUpdated: (updatedSymbol, _, __) => updatedSymbol == symbol,
          orElse: () => false,
        );
      },
      builder: (context, state) {
        String? realTimePrice;
        String? realTimeChangePercent;

        state.maybeWhen(
          priceUpdated: (updatedSymbol, price, changePercent) {
            if (updatedSymbol == symbol) {
              realTimePrice = price;
              realTimeChangePercent = changePercent;
            }
          },
          orElse: () {},
        );

        final priceChange = realTimeChangePercent != null
            ? double.tryParse(realTimeChangePercent!) ?? 0
            : coin.priceChangePercentage24h ?? 0;
        final isPositive = priceChange >= 0;

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                context.pushNamed(
                  Routes.detailCoinScreen,
                  arguments: DetailCoinScreenArgs(coinId: coin.id ?? ""),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.network(
                        coin.image ?? 'https://via.placeholder.com/32',
                        height: 32,
                        width: 32,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 32,
                            width: 32,
                            color: Colors.grey[200],
                            child: Icon(Icons.currency_bitcoin, color: Colors.grey[400], size: 20),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            coin.name ?? 'Unknown',
                            style: AppTextStyle.titleText.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            coin.symbol?.toUpperCase() ?? 'N/A',
                            style: AppTextStyle.description.copyWith(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (coin.sparklineIn7d?.price != null)
                      SizedBox(
                        width: 48,
                        height: 24,
                        child: Sparkline(
                          data: coin.sparklineIn7d!.price,
                          lineWidth: 1.0,
                          lineColor: isPositive ? AppColors.green : AppColors.red,
                          fillMode: FillMode.below,
                          fillGradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: isPositive
                                ? [AppColors.green.withOpacity(0.2), Colors.green.withOpacity(0.05)]
                                : [AppColors.red.withOpacity(0.2), Colors.red.withOpacity(0.05)],
                          ),
                        ),
                      ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          realTimePrice != null
                              ? '\$${double.tryParse(realTimePrice!)?.toStringAsFixed(2) ?? realTimePrice}'
                              : '\$${coin.currentPrice?.toStringAsFixed(2) ?? 'N/A'}',
                          style: AppTextStyle.titleText.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: isPositive ? Colors.green[50] : Colors.red[50],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            '${isPositive ? '+' : ''}${priceChange.toStringAsFixed(2)}%',
                            style: AppTextStyle.description.copyWith(
                              color: isPositive ? AppColors.green : AppColors.red,
                              fontWeight: FontWeight.w600,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildExchangeItem(dynamic exchange) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            context.pushNamed(
              Routes.detailExchangeScreen,
              arguments: DetailExchangeScreenArgs(exchangeId: exchange.id ?? ""),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                ClipOval(
                  child: Image.network(
                    exchange.image ?? 'https://via.placeholder.com/32',
                    height: 32,
                    width: 32,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 32,
                        width: 32,
                        color: Colors.grey[200],
                        child: Icon(Icons.storefront, color: Colors.grey[400], size: 20),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        exchange.name ?? 'Unknown Exchange',
                        style: AppTextStyle.titleText.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        exchange.country ?? 'N/A',
                        style: AppTextStyle.description.copyWith(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      exchange.tradeVolume24hBtc != null
                          ? '${exchange.tradeVolume24hBtc!.toStringAsFixed(2)} BTC'
                          : 'N/A',
                      style: AppTextStyle.titleText.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Vol 24h',
                        style: AppTextStyle.description.copyWith(
                          color: Colors.blue[700],
                          fontWeight: FontWeight.w600,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}