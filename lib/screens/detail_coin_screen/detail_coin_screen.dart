import 'package:crypto_app/app_common_data/app_colors.dart';
import 'package:crypto_app/models/coin/coin_market.dart';
import 'package:crypto_app/public_providers/providers/coin_price_cubit/coin_price_cubit.dart';
import 'package:crypto_app/screens/bloc_base_screen.dart';
import 'package:crypto_app/screens/detail_coin_screen/cubit/detail_coin_screen_cubit.dart';
import 'package:crypto_app/shared_customization/helpers/string_helper.dart';
import 'package:crypto_app/shared_customization/widgets/custom_widgets/app_dismiss_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:pretty_animated_buttons/pretty_animated_buttons.dart';
import '../../models/chart/chart.dart';

class DetailCoinScreenArgs {
  final String coinId;
  const DetailCoinScreenArgs({required this.coinId});
}

class DetailCoinScreen extends StatefulWidget {
  const DetailCoinScreen({super.key, required this.args});
  final DetailCoinScreenArgs args;

  @override
  State<DetailCoinScreen> createState() => _DetailCoinScreenState();
}

class _DetailCoinScreenState extends State<DetailCoinScreen> {
  late TrackballBehavior trackballBehavior;
  final List<int> dayOptions = [1, 7, 30, 90, 180, 365];
  String? _realTimePrice;
  String? _realTimeChangePercent;

  @override
  void initState() {
    super.initState();
    trackballBehavior = TrackballBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
      tooltipDisplayMode: TrackballDisplayMode.floatAllPoints, // Improved tooltip
    );
    final coinPriceCubit = context.read<CoinPriceCubit>();
    coinPriceCubit.subscribeToCoin(widget.args.coinId.toUpperCase());
  }

  @override
  void dispose() {
    final coinPriceCubit = context.read<CoinPriceCubit>();
    coinPriceCubit.unsubscribeFromCoin(widget.args.coinId.toUpperCase());
    super.dispose();
  }

  Widget _buildCoinInfo(CoinMarket coin, DetailCoinScreenState state) {
    return BlocBuilder<CoinPriceCubit, CoinPriceState>(
      buildWhen: (previous, current) {
        return current.maybeWhen(
          priceUpdated: (updatedSymbol, _, __) => updatedSymbol == coin.symbol?.toUpperCase(),
          orElse: () => false,
        );
      },
      builder: (context, priceState) {
        priceState.maybeWhen(
          priceUpdated: (updatedSymbol, price, changePercent) {
            if (updatedSymbol == coin.symbol?.toUpperCase()) {
              _realTimePrice = price;
              _realTimeChangePercent = changePercent;
            }
          },
          orElse: () {},
        );

        final priceChange = _realTimeChangePercent != null
            ? double.tryParse(_realTimeChangePercent!) ?? 0
            : coin.priceChangePercentage24h ?? 0;
        final isPositive = priceChange >= 0;

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Consistent margin
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), // Soft corners
            color: Colors.white, // White background
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade100, // Softer shadow
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      coin.image ?? 'https://via.placeholder.com/40',
                      height: 48,
                      width: 48,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50, // Light blue fallback
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(Icons.currency_bitcoin, color: Colors.blue.shade200, size: 28),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          coin.name ?? 'No Name',
                          style: const TextStyle(
                            fontSize: 18, // Larger for emphasis
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          coin.symbol?.toUpperCase() ?? '-',
                          style: TextStyle(
                            color: Colors.blue.shade400, // Light blue accent
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              _realTimePrice != null
                                  ? '\$${double.tryParse(_realTimePrice!)?.toStringAsFixed(2) ?? _realTimePrice}'
                                  : '\$${coin.currentPrice?.toStringAsFixed(2) ?? '-'}',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: isPositive ? Colors.green.shade600 : Colors.red.shade600, // Keep green/red for clarity
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: isPositive ? Colors.green.shade50 : Colors.red.shade50,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                '${isPositive ? '+' : ''}${priceChange.toStringAsFixed(2)}%',
                                style: TextStyle(
                                  color: isPositive ? Colors.green.shade700 : Colors.red.shade700,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (coin.description != null) ...[
                const SizedBox(height: 12),
                Text(
                  state.isDescriptionExpanded
                      ? coin.description!
                      : _getShortDescription(coin.description!),
                  maxLines: state.isDescriptionExpanded ? null : 3,
                  overflow: state.isDescriptionExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade700, // Softer text color
                    height: 1.5,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      context.read<DetailCoinScreenCubit>().toggleDescriptionExpanded();
                    },
                    child: Text(
                      state.isDescriptionExpanded ? 'Show less' : 'Read more',
                      style: TextStyle(
                        color: Colors.blue.shade400, // Light blue
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  String _getShortDescription(String description) {
    final sentences = description.split('. ');
    if (sentences.length > 1) {
      return sentences.take(2).join('. ') + '...';
    }
    return description;
  }

  Widget _buildChart(DetailCoinScreenState state) {
    if (state.chartData != null) {
      List<Chart> sampledData = [];
      for (int i = 0; i < state.chartData!.length; i += 5) {
        sampledData.add(state.chartData![i]);
      }

      return Container(
        height: 340,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white, // White background
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: SfCartesianChart(
          plotAreaBorderWidth: 0,
          margin: const EdgeInsets.all(12),
          trackballBehavior: trackballBehavior,
          zoomPanBehavior: ZoomPanBehavior(
            enablePanning: true,
            zoomMode: ZoomMode.xy,
            enableSelectionZooming: true,
            enableDoubleTapZooming: true,
            enablePinching: true,
            maximumZoomLevel: 0.05,
            enableMouseWheelZooming: true,
          ),
          primaryXAxis: DateTimeAxis(
            majorGridLines: const MajorGridLines(width: 0),
            labelStyle: TextStyle(fontSize: 11, color: Colors.grey.shade600),
          ),
          primaryYAxis: NumericAxis(
            labelStyle: TextStyle(fontSize: 11, color: Colors.grey.shade600),
          ),
          series: <CartesianSeries>[
            CandleSeries<Chart, DateTime>(
              enableSolidCandles: true,
              enableTooltip: true,
              bullColor: Colors.green.shade600,
              bearColor: Colors.red.shade600,
              xValueMapper: (Chart chart, _) => DateTime.fromMillisecondsSinceEpoch(chart.time!),
              lowValueMapper: (Chart chart, _) => chart.low ?? 0.0,
              highValueMapper: (Chart chart, _) => chart.high ?? 0.0,
              openValueMapper: (Chart chart, _) => chart.open ?? 0.0,
              closeValueMapper: (Chart chart, _) => chart.close ?? 0.0,
              dataSource: state.chartData!,
            ),
            LineSeries<Chart, DateTime>(
              color: Colors.blue.shade300, // Light blue trend line
              width: 2,
              xValueMapper: (Chart chart, _) => DateTime.fromMillisecondsSinceEpoch(chart.time!),
              yValueMapper: (Chart chart, _) =>
              (chart.open! + chart.close! + chart.high! + chart.low!) / 4,
              dataSource: sampledData,
            ),
          ],
        ),
      );
    } else if (state.errorMessage != null) {
      return Center(
        child: Text(
          'Error: ${state.errorMessage}',
          style: TextStyle(color: Colors.red.shade600, fontSize: 14),
        ),
      );
    } else {
      return Center(
        child: LoadingAnimationWidget.waveDots(
          color: Colors.blue.shade300, // Light blue loader
          size: 32,
        ),
      );
    }
  }

  Widget _buildAIPrediction(String prediction) {
    final formattedPrediction = StringHelper().formatAIPrediction(prediction);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white, // White background
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.auto_awesome, color: Colors.blue.shade300, size: 24), // Light blue icon
              const SizedBox(width: 8),
              Text(
                'AI Prediction',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87, // Darker for contrast
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade700,
                height: 1.5,
              ),
              children: _parseFormattedText(formattedPrediction),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {
                context.read<DetailCoinScreenCubit>().predictWithAI(widget.args.coinId);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade200, // Light blue button
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 1,
                minimumSize: const Size(0, 40),
              ),
              child: const Text(
                'Refresh',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<TextSpan> _parseFormattedText(String text) {
    final List<TextSpan> textSpans = [];
    final RegExp boldRegex = RegExp(r'\*\*(.*?)\*\*');
    final parts = text.split(boldRegex);

    for (int i = 0; i < parts.length; i++) {
      if (i % 2 == 0) {
        textSpans.add(TextSpan(text: parts[i]));
      } else {
        textSpans.add(TextSpan(
          text: parts[i],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ));
      }
    }

    return textSpans;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBaseScreen<DetailCoinScreenCubit, DetailCoinScreenState>(
      cubitInstance: DetailCoinScreenCubit()..loadData(widget.args.coinId, 1),
      builder: (context, state) {
        return AppDismissKeyboard(
          child: Scaffold(
            backgroundColor: Colors.white, // White background
            appBar: AppBar(
              title: Text(
                widget.args.coinId.toUpperCase(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87, // Dark text for contrast
                ),
              ),
              backgroundColor: Colors.white, // Colorless (white) AppBar
              elevation: 1, // Subtle shadow
              iconTheme: IconThemeData(color: Colors.blue.shade300), // Light blue icons
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 8), // Top spacing
                    if (state.coins != null) _buildCoinInfo(state.coins!, state),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: dayOptions.map((days) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: ChoiceChip(
                                label: Text(
                                  days == 1
                                      ? '1D'
                                      : (days == 7 ? '1W' : '${days ~/ 30}M'),
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: state.selectedDays == days
                                        ? Colors.white
                                        : Colors.blue.shade300, // Light blue text
                                  ),
                                ),
                                selected: state.selectedDays == days,
                                onSelected: (_) => context
                                    .read<DetailCoinScreenCubit>()
                                    .updateSelectedDays(days),
                                selectedColor: Colors.blue.shade200, // Light blue selected
                                backgroundColor: Colors.blue.shade50, // Very light blue
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                elevation: state.selectedDays == days ? 1 : 0,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    _buildChart(state),
                    if (state.isLoadingAI ?? false)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: LoadingAnimationWidget.threeRotatingDots(
                          color: Colors.blue.shade300, // Light blue
                          size: 28,
                        ),
                      ),
                    if (state.aiPrediction != null)
                      _buildAIPrediction(state.aiPrediction!),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: PrettyCapsuleButton(
                        label: "AI Predict",
                        onPressed: () {
                          context
                              .read<DetailCoinScreenCubit>()
                              .predictWithAI(widget.args.coinId);
                        },
                        bgColor: Colors.blue.shade200, // Light blue button
                        foregroundColor: Colors.white,
                        labelStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                      ),
                    ),
                    const SizedBox(height: 16), // Bottom spacing
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