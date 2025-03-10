// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExchangeImpl _$$ExchangeImplFromJson(Map<String, dynamic> json) =>
    _$ExchangeImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      yearEstablished: (json['year_established'] as num?)?.toInt(),
      country: json['country'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      image: json['image'] as String?,
      facebookUrl: json['facebookUrl'] as String?,
      redditUrl: json['redditUrl'] as String?,
      telegramUrl: json['telegramUrl'] as String?,
      slackUrl: json['slackUrl'] as String?,
      otherUrl1: json['otherUrl1'] as String?,
      otherUrl2: json['otherUrl2'] as String?,
      twitterHandle: json['twitterHandle'] as String?,
      hasTradingIncentive: json['has_trading_incentive'] as bool?,
      centralized: json['centralized'] as bool?,
      publicNotice: json['publicNotice'] as String?,
      alertNotice: json['alertNotice'] as String?,
      trustScore: (json['trustScore'] as num?)?.toInt(),
      trustScoreRank: (json['trust_score_rank'] as num?)?.toInt(),
      coins: (json['coins'] as num?)?.toInt(),
      pairs: (json['pairs'] as num?)?.toInt(),
      tradeVolume24hBtc: (json['trade_volume_24h_btc'] as num?)?.toDouble(),
      tradeVolume24hBtcNormalized:
          (json['trade_volume_24h_btc_normalized'] as num?)?.toDouble(),
      tickers: (json['tickers'] as List<dynamic>?)
          ?.map((e) => TickerExchange.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ExchangeImplToJson(_$ExchangeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'year_established': instance.yearEstablished,
      'country': instance.country,
      'description': instance.description,
      'url': instance.url,
      'image': instance.image,
      'facebookUrl': instance.facebookUrl,
      'redditUrl': instance.redditUrl,
      'telegramUrl': instance.telegramUrl,
      'slackUrl': instance.slackUrl,
      'otherUrl1': instance.otherUrl1,
      'otherUrl2': instance.otherUrl2,
      'twitterHandle': instance.twitterHandle,
      'has_trading_incentive': instance.hasTradingIncentive,
      'centralized': instance.centralized,
      'publicNotice': instance.publicNotice,
      'alertNotice': instance.alertNotice,
      'trustScore': instance.trustScore,
      'trust_score_rank': instance.trustScoreRank,
      'coins': instance.coins,
      'pairs': instance.pairs,
      'trade_volume_24h_btc': instance.tradeVolume24hBtc,
      'trade_volume_24h_btc_normalized': instance.tradeVolume24hBtcNormalized,
      'tickers': instance.tickers,
    };
