
import 'package:crypto_app/models/exchange/exchange/exchange.dart';
import 'package:crypto_app/screens/bloc_base_screen.dart';
import 'package:crypto_app/screens/detail_exchange_screen/cubit/detail_exchange_screen_cubit.dart';
import 'package:crypto_app/shared_customization/widgets/custom_widgets/app_dismiss_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailExchangeScreenArgs {
  final String exchangeId;
  const DetailExchangeScreenArgs({required this.exchangeId});
}

class DetailExchangeScreen extends StatefulWidget {
  const DetailExchangeScreen({super.key, required this.args});
  final DetailExchangeScreenArgs args;

  @override
  State<DetailExchangeScreen> createState() => _DetailExchangeScreenState();
}

class _DetailExchangeScreenState extends State<DetailExchangeScreen> {
  bool isDescriptionExpanded = false;

  Widget _buildExchangeInfo(Exchange exchange) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 6, offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                exchange.image ?? 'fallback_image_url',
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
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      exchange.country ?? 'No Country',
                      style: const TextStyle(color: Colors.grey),
                    ),
                    Text(
                      'Trust Score: ${exchange.trustScore}',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (exchange.description != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isDescriptionExpanded
                      ? exchange.description!
                      : exchange.description!.split('\n').take(5).join('\n'),
                  maxLines: isDescriptionExpanded ? null : 5,
                  overflow: isDescriptionExpanded ? null : TextOverflow.ellipsis,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isDescriptionExpanded = !isDescriptionExpanded;
                    });
                  },
                  child: Text(isDescriptionExpanded ? 'Show less' : 'Read more'),
                ),
              ],
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBaseScreen<DetailExchangeScreenCubit, DetailExchangeScreenState>(
      cubitInstance: DetailExchangeScreenCubit()..getExchangebyId(widget.args.exchangeId),
      builder: (context, state) {
        return AppDismissKeyboard(
          child: Scaffold(
            appBar: AppBar(
              title: Text(widget.args.exchangeId),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (state.exchange != null)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildExchangeInfo(state.exchange!),
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
