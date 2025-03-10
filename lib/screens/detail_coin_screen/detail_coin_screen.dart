import 'package:crypto_app/app_common_data/app_colors.dart';
import 'package:crypto_app/models/coin/coin_market.dart';
import 'package:crypto_app/screens/bloc_base_screen.dart';
import 'package:crypto_app/screens/detail_coin_screen/cubit/detail_coin_screen_cubit.dart';
import 'package:crypto_app/shared_customization/widgets/custom_widgets/app_dismiss_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
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
  int selectedDays = 1;
  bool isDescriptionExpanded = false;

  final List<int> dayOptions = [1, 7, 30, 90, 180, 365];

  @override
  void initState() {
    super.initState();
    trackballBehavior = TrackballBehavior(enable: true, activationMode: ActivationMode.singleTap);
  }

  void _onDaysChanged(int days) {
    setState(() {
      selectedDays = days;
    });
    context.read<DetailCoinScreenCubit>().getChart(widget.args.coinId, days);
  }

  Widget _buildCoinInfo(CoinMarket coin) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 6, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                coin.image ?? 'fallback_image_url',
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(coin.name ?? 'No Name', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(coin.symbol?.toUpperCase() ?? '-', style: const TextStyle(color: Colors.grey, fontSize: 14)),
                    Text(
                      '\$${coin.currentPrice?.toStringAsFixed(2) ?? '-'}',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.green),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (coin.description != null) ...[
            const SizedBox(height: 12),
            Text(
              isDescriptionExpanded ? coin.description! : coin.description!.split('. ').take(2).join('. ') + '...',
              maxLines: isDescriptionExpanded ? null : 3,
              overflow: TextOverflow.ellipsis,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => setState(() => isDescriptionExpanded = !isDescriptionExpanded),
                child: Text(isDescriptionExpanded ? 'Show less' : 'Read more'),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildChart(DetailCoinScreenState state) {
    if (state.chartData != null) {
      // Lấy mẫu dữ liệu mỗi 5 điểm một lần
      List<Chart> sampledData = [];
      for (int i = 0; i < state.chartData!.length; i += 5) {
        sampledData.add(state.chartData![i]);
      }

      return SfCartesianChart(
        plotAreaBorderWidth: 0, // Ẩn viền để trông đẹp hơn
        margin: const EdgeInsets.only(right: 10), // Cách bên phải 20 pixel
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
        series: <CartesianSeries>[
          // Biểu đồ nến
          CandleSeries<Chart, int>(
            enableSolidCandles: true,
            enableTooltip: true,
            bullColor: AppColors.green,
            bearColor: AppColors.red,
            xValueMapper: (Chart chart, _) => chart.time,
            lowValueMapper: (Chart chart, _) => chart.low ?? 0.0,
            highValueMapper: (Chart chart, _) => chart.high ?? 0.0,
            openValueMapper: (Chart chart, _) => chart.open ?? 0.0,
            closeValueMapper: (Chart chart, _) => chart.close ?? 0.0,
            dataSource: state.chartData!,
          ),
          // Đường trung bình giá (lấy mẫu mỗi 5 điểm)
          LineSeries<Chart, int>(
            color: Colors.blue,
            width: 2,
            xValueMapper: (Chart chart, _) => chart.time,
            yValueMapper: (Chart chart, _) =>
            (chart.open! + chart.close! + chart.high! + chart.low!) / 4, // Giá trung bình
            dataSource: sampledData, // Chỉ vẽ line mỗi 5 điểm
          ),
        ],
      );
    } else if (state.errorMessage != null) {
      return Center(child: Text('Error: ${state.errorMessage}', style: const TextStyle(color: Colors.red)));
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }



  @override
  Widget build(BuildContext context) {
    return BlocBaseScreen<DetailCoinScreenCubit, DetailCoinScreenState>(
      cubitInstance: DetailCoinScreenCubit()..loadData(widget.args.coinId, selectedDays),
      builder: (context, state) {
        return AppDismissKeyboard(
          child: Scaffold(
            appBar: AppBar(title: Text(widget.args.coinId.toUpperCase())),
            body: SafeArea(
              child: Column(
                children: [
                  if (state.coins != null) _buildCoinInfo(state.coins!),
                  const SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: dayOptions.map((days) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: ChoiceChip(
                            label: Text(days == 1 ? '1D' : (days == 7 ? '1W' : '${days ~/ 30}M')),
                            selected: selectedDays == days,
                            onSelected: (_) => _onDaysChanged(days),
                            selectedColor: AppColors.grey,
                            backgroundColor: Colors.grey[200],
                            labelStyle: TextStyle(color: selectedDays == days ? Colors.white : Colors.black),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Expanded(child: Padding(
                    padding: EdgeInsets.only(right: 20, left: 10),
                      child: _buildChart(state))),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
