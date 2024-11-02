import 'package:equatable/equatable.dart';

class WatchlistState extends Equatable {
  final bool loading;
  final List<Watchlist> watchlist;

  const WatchlistState({this.loading = true, this.watchlist = const []});

  factory WatchlistState.fromJson(dynamic json) {
    return WatchlistState(
        watchlist:
            (json as List<dynamic>).map((e) => Watchlist.fromJson(e)).toList());
  }

  WatchlistState copyWith({
    bool? loading,
    List<Watchlist>? watchlist,
  }) =>
      WatchlistState(
          loading: loading ?? this.loading,
          watchlist: watchlist ?? this.watchlist);

  @override
  List<Object?> get props => [loading, watchlist];
}

class Watchlist extends Equatable {
  const Watchlist({
    required this.id,
    required this.ticker,
    required this.name,
    this.legalName,
    this.type,
    this.sponsor,
    this.website,
    this.sponsorLogoUrl,
    this.price,
    this.change,
    this.ipoDate,
    this.isSponsored,
    this.volatility3yUi,
    this.returns3yUi,
    this.isTradable,
    this.tradability,
  });

  final int id;
  final String ticker;
  final String name;
  final String? legalName;
  final String? type;
  final String? sponsor;
  final String? website;
  final String? sponsorLogoUrl;
  final num? price;
  final num? change;
  final String? ipoDate;
  final bool? isSponsored;
  final String? volatility3yUi;
  final String? returns3yUi;
  final bool? isTradable;
  final String? tradability;

  factory Watchlist.fromJson(dynamic json) {
    return Watchlist(
        id: json['id'],
        ticker: json['ticker'],
        name: json['name'],
        legalName: json['legalName'] as String?,
        type: json['type'] as String?,
        sponsor: json['sponsor'] as String?,
        website: json['website'] as String?,
        sponsorLogoUrl: json['sponsorLogoUrl'] as String?,
        price: json['price'],
        change: json['change'],
        ipoDate: json['ipoDate'] as String?,
        isSponsored: json['isSponsored'] as bool?,
        volatility3yUi: json['volatility3yUi'] as String?,
        returns3yUi: json['returns3yUi'] as String?,
        isTradable: json['isTradable'] as bool?,
        tradability: json['tradability'] as String?);
  }

  Watchlist copyWith({
    int? id,
    String? ticker,
    String? name,
    String? legalName,
    String? type,
    String? sponsor,
    String? website,
    String? sponsorLogoUrl,
    num? price,
    num? change,
    String? ipoDate,
    bool? isSponsored,
    String? volatility3yUi,
    String? returns3yUi,
    bool? isTradable,
    String? tradability,
  }) =>
      Watchlist(
        id: id ?? this.id,
        ticker: ticker ?? this.ticker,
        name: name ?? this.name,
        legalName: legalName ?? this.legalName,
        type: type ?? this.type,
        sponsor: sponsor ?? this.sponsor,
        website: website ?? this.website,
        sponsorLogoUrl: sponsorLogoUrl ?? this.sponsorLogoUrl,
        price: price ?? this.price,
        change: change ?? this.change,
        ipoDate: ipoDate ?? this.ipoDate,
        isSponsored: isSponsored ?? this.isSponsored,
        volatility3yUi: volatility3yUi ?? this.volatility3yUi,
        returns3yUi: returns3yUi ?? this.returns3yUi,
        isTradable: isTradable ?? this.isTradable,
        tradability: tradability ?? this.tradability,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['ticker'] = ticker;
    map['name'] = name;
    map['legalName'] = legalName;
    map['type'] = type;
    map['sponsor'] = sponsor;
    map['website'] = website;
    map['sponsorLogoUrl'] = sponsorLogoUrl;
    map['price'] = price;
    map['change'] = change;
    map['ipoDate'] = ipoDate;
    map['isSponsored'] = isSponsored;
    map['volatility3yUi'] = volatility3yUi;
    map['returns3yUi'] = returns3yUi;
    map['isTradable'] = isTradable;
    map['tradability'] = tradability;
    return map;
  }

  @override
  List<Object?> get props => [
        id,
        ticker,
        name,
        legalName,
        type,
        sponsor,
        website,
        sponsorLogoUrl,
        price,
        change,
        ipoDate,
        isSponsored,
        volatility3yUi,
        returns3yUi,
        isTradable,
        tradability
      ];
}
