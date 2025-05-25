import 'package:crypto_app/app_common_data/app_colors.dart';
import 'package:crypto_app/app_common_data/app_text_sytle.dart';
import 'package:crypto_app/app_common_data/routes/app_routes.dart';
import 'package:crypto_app/models/coin/coin_market.dart';
import 'package:crypto_app/public_providers/providers/coin_price_cubit/coin_price_cubit.dart';
import 'package:crypto_app/screens/home_screen/cubit/home_screen_cubit.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../generated/translations.g.dart';
import '../../shared_customization/extensions/build_context.ext.dart';
import '../../shared_customization/widgets/texts/app_text.dart';
import '../detail_coin_screen/detail_coin_screen.dart';

class FavoriteCoinsScreen extends StatelessWidget {
  const FavoriteCoinsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<HomeScreenCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(tr('FavoriteCoinsScreen.title')), // Localized title
        ),
        body: BlocBuilder<HomeScreenCubit, HomeScreenState>(
          builder: (context, state) {
            if (state.favoriteCoins == null) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.favoriteCoins!.isEmpty) {
              return Center(child: Text(tr('FavoriteCoinsScreen.empty_state'))); // Localized empty state
            }
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.favoriteCoins!.length,
              itemBuilder: (context, index) {
                final coin = state.favoriteCoins![index];
                return _buildCoinItem(context, coin);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildCoinItem(BuildContext context, CoinMarket coin) {
    final symbol = coin.symbol?.toUpperCase() ?? '';
    final isFavorite = context.read<HomeScreenCubit>().state.favoriteCoins?.any((c) => c.id == coin.id) ?? false;
    final firebaseAuth = FirebaseAuth.instance;

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
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.06),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: () {
                context.pushNamed(
                  Routes.detailCoinScreen,
                  arguments: DetailCoinScreenArgs(coinId: coin.id ?? ""),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 3,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.network(
                          coin.image ?? 'https://via.placeholder.com/36',
                          height: 36,
                          width: 36,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 36,
                              width: 36,
                              color: Colors.grey[200],
                              child: Icon(Icons.currency_bitcoin, color: Colors.grey[400], size: 20),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            coin.name ?? tr(LocaleKeys.HomeScreen_Unknown),
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            coin.symbol?.toUpperCase() ?? 'N/A',
                            style: TextStyle(color: Colors.grey[600], fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.grey,
                        size: 20,
                      ),
                      onPressed: () {
                        if (firebaseAuth.currentUser == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(tr('FavoriteCoinsScreen.login_required'))), // Localized SnackBar
                          );
                          context.pushNamed(Routes.loginScreen);
                        } else if (isFavorite) {
                          context.read<HomeScreenCubit>().removeFavoriteCoin(coin.id.toString());
                        } else {
                          context.read<HomeScreenCubit>().addFavoriteCoin(coin.id.toString());
                        }
                      },
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
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          realTimePrice != null
                              ? '\$${double.tryParse(realTimePrice!)?.toStringAsFixed(2) ?? realTimePrice}'
                              : '\$${coin.currentPrice?.toStringAsFixed(2) ?? 'N/A'}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
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
                            style: TextStyle(
                              color: isPositive ? AppColors.green : AppColors.red,
                              fontWeight: FontWeight.w500,
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
}