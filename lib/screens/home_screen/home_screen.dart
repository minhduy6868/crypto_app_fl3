import 'package:crypto_app/public_providers/providers/coin_price_cubit/coin_price_cubit.dart';
import 'package:crypto_app/screens/home_screen/components/menu_bar_component.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:crypto_app/app_common_data/app_colors.dart';
import 'package:crypto_app/app_common_data/app_text_sytle.dart';
import 'package:crypto_app/app_common_data/routes/app_routes.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:crypto_app/models/coin/coin_market.dart';
import 'package:crypto_app/models/exchange/exchange/exchange.dart';
import 'package:crypto_app/screens/home_screen/cubit/home_screen_cubit.dart';
import 'package:crypto_app/shared_customization/extensions/build_context.ext.dart';
import 'package:crypto_app/shared_customization/widgets/custom_widgets/app_dismiss_keyboard.dart';
import 'package:crypto_app/shared_customization/widgets/texts/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../generated/translations.g.dart';
import '../../shared_customization/helpers/string_helper.dart';
import '../detail_coin_screen/detail_coin_screen.dart';
import '../detail_exchange_screen/detail_exchange_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  InterstitialAd? _interstitialAd;
  final Set<String> _subscribedSymbols = {};
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  late HomeScreenCubit _homeScreenCubit;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _homeScreenCubit = HomeScreenCubit()..loadData();
  }

  void _loadAndShowInterstitialAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-1621248632569820/8708977106',
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (InterstitialAd ad) {
              ad.dispose();
              context.pushNamed(Routes.ggAdsScreen);
            },
            onAdFailedToShowFullScreenContent:
                (InterstitialAd ad, AdError error) {
              ad.dispose();
              context.pushNamed(Routes.ggAdsScreen);
            },
          );
          ad.show();
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('DEBUG: Ad failed to load: $error');
          context.pushNamed(Routes.ggAdsScreen);
        },
      ),
    );
  }

  @override
  void dispose() {
    final coinPriceCubit = context.read<CoinPriceCubit>();
    for (var symbol in _subscribedSymbols) {
      coinPriceCubit.unsubscribeFromCoin(symbol);
    }
    _subscribedSymbols.clear();
    _interstitialAd?.dispose();
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeScreenCubit>.value(
      value: _homeScreenCubit,
      child: BlocConsumer<HomeScreenCubit, HomeScreenState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage!)),
            );
          }
        },
        builder: (context, state) {
// Handle coin subscription for real-time updates
          if (state.listcoinMarket != null) {
            final coins = state.listcoinMarket!.take(5).toList();
            final coinPriceCubit = context.read<CoinPriceCubit>();
            for (var coin in coins) {
              final symbol = coin.symbol?.toUpperCase() ?? '';
              if (symbol.isNotEmpty && !_subscribedSymbols.contains(symbol)) {
                coinPriceCubit.subscribeToCoin(symbol);
                _subscribedSymbols.add(symbol);
              }
            }
// Subscribe to favorite coins
            if (state.favoriteCoins != null) {
              for (var coin in state.favoriteCoins!) {
                final symbol = coin.symbol?.toUpperCase() ?? '';
                if (symbol.isNotEmpty && !_subscribedSymbols.contains(symbol)) {
                  coinPriceCubit.subscribeToCoin(symbol);
                  _subscribedSymbols.add(symbol);
                }
              }
            }
          }

          return Scaffold(
            backgroundColor: const Color(0xFFF8F9FA),
            body: SafeArea(
              child: AppDismissKeyboard(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        _buildHeader(),
                        const SizedBox(height: 8),
                        _buildSearchBar(),
                        const SizedBox(height: 8),
                        MenuBarComponent(),
                        const SizedBox(height: 12),
                        _buildFavoriteCoinsSection(state),
                        const SizedBox(height: 12),
                        _buildPopularCoinsSection(state),
                        const SizedBox(height: 12),
                        RefreshIndicator(
                          color: Theme.of(context).primaryColor,
                          onRefresh: () async {
                            await _homeScreenCubit.loadData();
                          },
                          child: Column(
                            children: [
                              if (state.isSearching == true)
                                _buildSearchResults(state)
                              else
                                Column(
                                  children: [
                                    _buildSectionHeader(
                                      title:
                                          tr(LocaleKeys.HomeScreen_Top7Coins),
                                      onSeeAllPressed: () {
                                        context.pushNamed(
                                            Routes.viewAllListScreen,
                                            arguments: false);
                                      },
                                    ),
                                    const SizedBox(height: 8),
                                    _buildCoinMarketList(state),
                                    const SizedBox(height: 24),
                                    _buildSectionHeader(
                                      title: tr(
                                          LocaleKeys.HomeScreen_Top5Exchanges),
                                      onSeeAllPressed: () {
                                        context.pushNamed(
                                            Routes.viewAllListScreen,
                                            arguments: true);
                                      },
                                    ),
                                    const SizedBox(height: 8),
                                    _buildExchangeList(state),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                StringHelper.isMorning()
                    ? tr(LocaleKeys.HomeScreen_GoodMorning)
                    : tr(LocaleKeys.HomeScreen_Welcome),
                style: AppTextStyle.titleText.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(height: 2),
              AppText(
                tr(LocaleKeys.HomeScreen_ExploreMarket),
                style: AppTextStyle.description.copyWith(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: _loadAndShowInterstitialAd,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const CircleAvatar(
              radius: 22,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/icons/music_app_icon.png'),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 46,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        focusNode: _searchFocusNode,
        style: const TextStyle(fontSize: 12),
        decoration: InputDecoration(
          hintText: tr(LocaleKeys.HomeScreen_SearchCoins),
          hintStyle: TextStyle(color: Colors.grey[400], fontSize: 11),
          prefixIcon: Icon(Icons.search, color: Colors.grey[400], size: 20),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.clear, color: Colors.grey[400], size: 16),
                  onPressed: () {
                    _searchController.clear();
                    _homeScreenCubit.clearSearch();
                    _searchFocusNode.unfocus();
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
        onChanged: (value) {
          _homeScreenCubit.setSearchQuery(value);
        },
      ),
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required VoidCallback onSeeAllPressed,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          title,
          style: AppTextStyle.titleText.copyWith(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        TextButton(
          onPressed: onSeeAllPressed,
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: AppText(
            tr(LocaleKeys.HomeScreen_SeeAll),
            style: AppTextStyle.description.copyWith(
              fontSize: 13,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFavoriteCoinsSection(HomeScreenState state) {
    if (state.favoriteCoins == null) {
      return _buildLoadingIndicator();
    }

    if (state.favoriteCoins!.isEmpty) {
      return _buildEmptyMessage(tr(LocaleKeys.HomeScreen_NoCoinsAvailable));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          title: tr(LocaleKeys.HomeScreen_FavoriteCoins),
          onSeeAllPressed: () {
            context.pushNamed(Routes.favoriteCoinsScreen);
          },
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 90,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.favoriteCoins!.length,
            itemBuilder: (context, index) {
              final coin = state.favoriteCoins![index];
              return _buildFavoriteCoinItem(coin);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPopularCoinsSection(HomeScreenState state) {
    if (state.listcoinMarket == null) {
      return _buildLoadingIndicator();
    }

    final hotCoinSymbols = ['BTC', 'ETH', 'BNB', 'SOL'];
    final hotCoins = state.listcoinMarket!
        .where((coin) => hotCoinSymbols.contains(coin.symbol?.toUpperCase()))
        .take(4)
        .toList();

    if (hotCoins.isEmpty) {
      return _buildEmptyMessage(tr(LocaleKeys.HomeScreen_NoCoinsAvailable));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          title: tr(LocaleKeys.HomeScreen_PopularCoins),
          onSeeAllPressed: () {
            context.pushNamed(Routes.viewAllListScreen, arguments: false);
          },
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 165,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hotCoins.length,
            itemBuilder: (context, index) {
              final coin = hotCoins[index];
              return _buildPopularCoinItem(coin);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPopularCoinItem(CoinMarket coin) {
    final symbol = coin.symbol?.toUpperCase() ?? '';

    return BlocBuilder<CoinPriceCubit, CoinPriceState>(
      buildWhen: (previous, current) {
        return current.maybeWhen(
          priceUpdated: (updatedSymbol, _, __) => updatedSymbol == symbol,
          orElse: () => false,
        );
      },
      builder: (context, priceState) {
        String? realTimePrice;
        String? realTimeChangePercent;

        priceState.maybeWhen(
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

        return BlocBuilder<HomeScreenCubit, HomeScreenState>(
          buildWhen: (previous, current) =>
              previous.favoriteCoins != current.favoriteCoins,
          builder: (context, homeState) {
            final isFavorite =
                homeState.favoriteCoins?.any((c) => c.id == coin.id) ?? false;

            return GestureDetector(
              onTap: () {
                context.pushNamed(
                  Routes.detailCoinScreen,
                  arguments: DetailCoinScreenArgs(coinId: coin.id ?? ""),
                );
              },
              child: Container(
                width: 165,
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.06),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.network(
                            coin.image ?? 'https://via.placeholder.com/28',
                            height: 28,
                            width: 28,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: 28,
                                width: 28,
                                color: Colors.grey[200],
                                child: Icon(Icons.currency_bitcoin,
                                    color: Colors.grey[400], size: 16),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            coin.symbol?.toUpperCase() ?? 'N/A',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.grey,
                            size: 20,
                          ),
                          onPressed: () {
                            if (_firebaseAuth.currentUser == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(tr(LocaleKeys
                                        .HomeScreen_LoginToFavorite))),
                              );
                              context.pushNamed(Routes.loginScreen);
                            } else if (isFavorite) {
                              context
                                  .read<HomeScreenCubit>()
                                  .removeFavoriteCoin(coin.id.toString());
                            } else {
                              context
                                  .read<HomeScreenCubit>()
                                  .addFavoriteCoin(coin.id.toString());
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      realTimePrice != null
                          ? '\$${double.tryParse(realTimePrice!)?.toStringAsFixed(2) ?? realTimePrice}'
                          : '\$${coin.currentPrice?.toStringAsFixed(2) ?? 'N/A'}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
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
                    const SizedBox(height: 8),
                    if (coin.sparklineIn7d?.price != null)
                      SizedBox(
                        height: 30, // Tăng chiều cao để tránh vỡ biểu đồ
                        width: double.infinity,
                        child: Sparkline(
                          data: coin.sparklineIn7d!.price,
                          lineWidth: 1.0,
                          lineColor:
                              isPositive ? AppColors.green : AppColors.red,
                          fillMode: FillMode.below,
                          fillGradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: isPositive
                                ? [
                                    AppColors.green.withOpacity(0.2),
                                    Colors.green.withOpacity(0.05)
                                  ]
                                : [
                                    AppColors.red.withOpacity(0.2),
                                    Colors.red.withOpacity(0.05)
                                  ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildFavoriteCoinItem(CoinMarket coin) {
    final symbol = coin.symbol?.toUpperCase() ?? '';

    return BlocBuilder<CoinPriceCubit, CoinPriceState>(
      buildWhen: (previous, current) {
        return current.maybeWhen(
          priceUpdated: (updatedSymbol, _, __) => updatedSymbol == symbol,
          orElse: () => false,
        );
      },
      builder: (context, priceState) {
        String? realTimePrice;
        String? realTimeChangePercent;

        priceState.maybeWhen(
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

        return BlocBuilder<HomeScreenCubit, HomeScreenState>(
          buildWhen: (previous, current) =>
          previous.favoriteCoins != current.favoriteCoins,
          builder: (context, homeState) {
            final isFavorite =
                homeState.favoriteCoins?.any((c) => c.id == coin.id) ?? false;

            return GestureDetector(
              onTap: () {
                context.pushNamed(
                  Routes.detailCoinScreen,
                  arguments: DetailCoinScreenArgs(coinId: coin.id ?? ""),
                );
              },
              child: Container(
                width: 200, // Wider for a rectangular layout
                height: 70, // Shorter height for a flatter, horizontal look
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6), // Minimal padding
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isFavorite ? Colors.red[200]! : Colors.grey[100]!, // Red border for favorites
                    width: 0.5, // Thin border for flat design
                  ),
                  // No boxShadow for a flat appearance
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            coin.image ?? 'https://via.placeholder.com/20',
                            height: 20,
                            width: 20,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: 20,
                                width: 20,
                                color: Colors.grey[200],
                                child: Icon(
                                  Icons.currency_bitcoin,
                                  color: Colors.grey[400],
                                  size: 12,
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              coin.symbol?.toUpperCase() ?? 'N/A',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              realTimePrice != null
                                  ? '\$${double.tryParse(realTimePrice!)?.toStringAsFixed(2) ?? realTimePrice}'
                                  : '\$${coin.currentPrice?.toStringAsFixed(2) ?? 'N/A'}',
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 1,
                              ),
                              decoration: BoxDecoration(
                                color: isPositive ? Colors.green[50] : Colors.red[50],
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                '${isPositive ? '+' : ''}${priceChange.toStringAsFixed(2)}%',
                                style: TextStyle(
                                  color: isPositive ? AppColors.green : AppColors.red,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 9,
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              icon: Icon(
                                isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: isFavorite ? Colors.red : Colors.grey[400],
                                size: 16,
                              ),
                              onPressed: () {
                                if (_firebaseAuth.currentUser == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          tr(LocaleKeys.HomeScreen_LoginToFavorite)),
                                    ),
                                  );
                                  context.pushNamed(Routes.loginScreen);
                                } else if (isFavorite) {
                                  context
                                      .read<HomeScreenCubit>()
                                      .removeFavoriteCoin(coin.id.toString());
                                } else {
                                  context
                                      .read<HomeScreenCubit>()
                                      .addFavoriteCoin(coin.id.toString());
                                }
                              },
                            ),
                          ],
                        ),
                        if (coin.sparklineIn7d?.price != null)
                          SizedBox(
                            width: 50,
                            height: 18, // Small sparkline for a compact look
                            child: Sparkline(
                              data: coin.sparklineIn7d!.price,
                              lineWidth: 0.7, // Thinner line
                              lineColor: isPositive ? AppColors.green : AppColors.red,
                              fillMode: FillMode.below,
                              fillGradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: isPositive
                                    ? [
                                  AppColors.green.withOpacity(0.1),
                                  Colors.green.withOpacity(0.02),
                                ]
                                    : [
                                  AppColors.red.withOpacity(0.1),
                                  Colors.red.withOpacity(0.02),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
  Widget _buildSearchResults(HomeScreenState state) {
    if (state.searchResults == null) {
      return const SizedBox.shrink();
    }

    if (state.searchResults!.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              Icon(Icons.search_off, size: 56, color: Colors.grey[400]),
              const SizedBox(height: 16),
              AppText(
                "${tr(LocaleKeys.HomeScreen_NoCoinsFound)} '${state.searchQuery}'",
                style: AppTextStyle.description.copyWith(
                  color: Colors.grey[600],
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: AppText(
            tr(LocaleKeys.HomeScreen_SearchResults),
            style: AppTextStyle.titleText.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.searchResults!.length,
          itemBuilder: (context, index) {
            final coin = state.searchResults![index];
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
        ),
      ],
    );
  }

  Widget _buildCoinMarketList(HomeScreenState state) {
    if (state.listcoinMarket == null) {
      return _buildLoadingIndicator();
    }

    if (state.errorMessage != null) {
      return _buildErrorMessage(state.errorMessage!);
    }

    final coins = state.listcoinMarket!.take(7).toList();

    if (coins.isEmpty) {
      return _buildEmptyMessage(tr(LocaleKeys.HomeScreen_NoCoinsAvailable));
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: coins.length,
      itemBuilder: (context, index) {
        final coin = coins[index];
        return _buildCoinItem(coin);
      },
    );
  }

  Widget _buildExchangeList(HomeScreenState state) {
    if (state.listExchange == null) {
      return _buildLoadingIndicator();
    }

    if (state.errorMessage != null) {
      return _buildErrorMessage(state.errorMessage!);
    }

    final exchanges = state.listExchange!.take(5).toList();

    if (exchanges.isEmpty) {
      return _buildEmptyMessage(tr(LocaleKeys.HomeScreen_NoExchangesAvailable));
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: exchanges.length,
      itemBuilder: (context, index) {
        final exchange = exchanges[index];
        return _buildExchangeItem(exchange);
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: LoadingAnimationWidget.flickr(
          leftDotColor: Theme.of(context).primaryColor,
          rightDotColor: AppColors.black,
          size: 30,
        ),
      ),
    );
  }

  Widget _buildErrorMessage(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: [
            Icon(Icons.error_outline, size: 36, color: Colors.red[400]),
            const SizedBox(height: 8),
            Text(
              message,
              style: TextStyle(color: Colors.red[400], fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyMessage(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Text(
          message,
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
      ),
    );
  }

  Widget _buildCoinItem(CoinMarket coin) {
    final symbol = coin.symbol?.toUpperCase() ?? '';

    return BlocBuilder<CoinPriceCubit, CoinPriceState>(
      buildWhen: (previous, current) {
        return current.maybeWhen(
          priceUpdated: (updatedSymbol, _, __) => updatedSymbol == symbol,
          orElse: () => false,
        );
      },
      builder: (context, priceState) {
        String? realTimePrice;
        String? realTimeChangePercent;

        priceState.maybeWhen(
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

        return BlocBuilder<HomeScreenCubit, HomeScreenState>(
          buildWhen: (previous, current) =>
              previous.favoriteCoins != current.favoriteCoins,
          builder: (context, homeState) {
            final isFavorite =
                homeState.favoriteCoins?.any((c) => c.id == coin.id) ?? false;

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
                                  child: Icon(Icons.currency_bitcoin,
                                      color: Colors.grey[400], size: 20),
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
                                maxLines: 1,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                coin.symbol?.toUpperCase() ?? 'N/A',
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 12),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
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
                            if (_firebaseAuth.currentUser == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(tr(LocaleKeys
                                        .HomeScreen_LoginToFavorite))),
                              );
                              context.pushNamed(Routes.loginScreen);
                            } else if (isFavorite) {
                              context
                                  .read<HomeScreenCubit>()
                                  .removeFavoriteCoin(coin.id.toString());
                            } else {
                              context
                                  .read<HomeScreenCubit>()
                                  .addFavoriteCoin(coin.id.toString());
                            }
                          },
                        ),
                        const SizedBox(width: 8),
                        if (coin.sparklineIn7d?.price != null)
                          SizedBox(
                            width: 48,
                            height: 24,
                            child: Sparkline(
                              data: coin.sparklineIn7d!.price,
                              lineWidth: 1.0,
                              lineColor:
                                  isPositive ? AppColors.green : AppColors.red,
                              fillMode: FillMode.below,
                              fillGradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: isPositive
                                    ? [
                                        AppColors.green.withOpacity(0.2),
                                        Colors.green.withOpacity(0.05)
                                      ]
                                    : [
                                        AppColors.red.withOpacity(0.2),
                                        Colors.red.withOpacity(0.05)
                                      ],
                              ),
                            ),
                          ),
                        const SizedBox(width: 12),
                        Flexible(
                          child: Column(
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
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              const SizedBox(height: 4),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: isPositive
                                      ? Colors.green[50]
                                      : Colors.red[50],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  '${isPositive ? '+' : ''}${priceChange.toStringAsFixed(2)}%',
                                  style: TextStyle(
                                    color: isPositive
                                        ? AppColors.green
                                        : AppColors.red,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildExchangeItem(Exchange exchange) {
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
              Routes.detailExchangeScreen,
              arguments:
                  DetailExchangeScreenArgs(exchangeId: exchange.id ?? ""),
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
                      exchange.image ?? 'https://via.placeholder.com/36',
                      height: 36,
                      width: 36,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 36,
                          width: 36,
                          color: Colors.grey[200],
                          child: Icon(Icons.storefront,
                              color: Colors.grey[400], size: 20),
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
                        exchange.name ?? tr(LocaleKeys.HomeScreen_Unknown),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 4),
                      if (exchange.country != null)
                        Text(
                          exchange.country!,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        exchange.tradeVolume24hBtc != null
                            ? '${exchange.tradeVolume24hBtc!.toStringAsFixed(2)} BTC'
                            : 'N/A',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          tr(LocaleKeys.HomeScreen_Vol24h),
                          style: TextStyle(
                            color: Colors.blue[700],
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
