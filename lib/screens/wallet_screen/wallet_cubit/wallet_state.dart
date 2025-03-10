part of 'wallet_cubit.dart';

@freezed
class WalletState with _$WalletState, BlocBaseState {
  const factory WalletState.initial({
    String? errorMessage,
    ScreenValue? status,
    String? mnemonic,
    String? privateKey,
    EthereumAddress? publicKey,
    double? balance,
    List<dynamic>? transactions,
  }) = _Initial;
}