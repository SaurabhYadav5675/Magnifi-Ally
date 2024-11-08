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
    this.id,
    required this.ticker,
    required this.name,
    this.sponsorLogoUrl,
    this.price,
    this.change,
  });

  final String? id;
  final String ticker;
  final String name;
  final String? sponsorLogoUrl;
  final num? price;
  final num? change;

  factory Watchlist.fromJson(dynamic json) {
    return Watchlist(
        id: json['id'] as String?,
        ticker: json['ticker'],
        name: json['companyName'],
        sponsorLogoUrl: json['sponsorLogoUrl'] as String?,
        price: json['price'],
        change: json['changePercentage']);
  }

  Watchlist copyWith({
    String? id,
    String? ticker,
    String? name,
    String? sponsorLogoUrl,
    num? price,
    num? change,
  }) =>
      Watchlist(
        id: id ?? this.id,
        ticker: ticker ?? this.ticker,
        name: name ?? this.name,
        sponsorLogoUrl: sponsorLogoUrl ?? this.sponsorLogoUrl,
        price: price ?? this.price,
        change: change ?? this.change,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['ticker'] = ticker;
    map['companyName'] = name;
    map['sponsorLogoUrl'] = sponsorLogoUrl;
    map['price'] = price;
    map['changePercentage'] = change;
    return map;
  }

  @override
  List<Object?> get props => [id, ticker, name, sponsorLogoUrl, price, change];
}
