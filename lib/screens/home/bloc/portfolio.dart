class Portfolio {
  Portfolio({
    this.metaData,
    required this.totalInvestment,
    required this.currentValue,
    required this.totalGain,
    required this.totalGainPercentage,
    this.topPerformers,
    this.topLosers,
  });

  factory Portfolio.fromJson(dynamic json) {
    try {
      return Portfolio(
          metaData: json['metaData'] != null
              ? (json['topLosers'] as List<dynamic>)
                  .map((e) => MetaData.fromJson(e))
                  .toList()
              : [],
          totalInvestment: json['totalInvestment'],
          currentValue: json['currentValue'],
          totalGain: json['totalGain'],
          totalGainPercentage: json['totalGainPercentage'],
          topLosers: json['topLosers'] != null
              ? (json['topLosers'] as List<dynamic>)
                  .map((e) => TopLosers.fromJson(e))
                  .toList()
              : [],
          topPerformers: json['topPerformers'] != null
              ? (json['topLosers'] as List<dynamic>)
                  .map((e) => TopPerformers.fromJson(e))
                  .toList()
              : []);
    } catch (e, s) {
      print("Data11 error in from json $e $s");
      rethrow;
    }
  }

  List<MetaData>? metaData;
  final String totalInvestment;
  final String currentValue;
  final String totalGain;
  final String totalGainPercentage;
  List<TopPerformers>? topPerformers;
  List<TopLosers>? topLosers;

  Portfolio copyWith({
    List<MetaData>? metaData,
    String? totalInvestment,
    String? currentValue,
    String? totalGain,
    String? totalGainPercentage,
    List<TopPerformers>? topPerformers,
    List<TopLosers>? topLosers,
  }) =>
      Portfolio(
          metaData: metaData ?? this.metaData,
          totalInvestment: totalInvestment ?? this.totalInvestment,
          currentValue: currentValue ?? this.currentValue,
          totalGain: totalGain ?? this.totalGain,
          totalGainPercentage: totalGainPercentage ?? this.totalGainPercentage,
          topPerformers: topPerformers ?? this.topPerformers,
          topLosers: topLosers ?? this.topLosers);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (metaData != null) {
      map['metaData'] = metaData?.map((v) => v.toJson()).toList();
    }
    map['totalInvestment'] = totalInvestment;
    map['currentValue'] = currentValue;
    map['totalGain'] = totalGain;
    map['totalGainPercentage'] = totalGainPercentage;
    if (topPerformers != null) {
      map['topPerformers'] = topPerformers?.map((v) => v.toJson()).toList();
    }
    if (topLosers != null) {
      map['topLosers'] = topLosers?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class TopLosers {
  TopLosers({
    required this.ticker,
    required this.companyName,
    required this.price,
    required this.quantity,
    required this.buyPrice,
    required this.diff,
    required this.totalReturn,
    required this.totalInvestment,
    required this.currentValue,
    required this.returnPercentage,
    required this.sponsorLogoUrl,
    required this.changePercentage,
  });

  factory TopLosers.fromJson(dynamic json) {
    return TopLosers(
        ticker: json['ticker'],
        companyName: json['companyName'],
        price: json['price'],
        quantity: json['quantity'],
        buyPrice: json['buyPrice'],
        diff: json['diff'],
        totalReturn: json['totalReturn'],
        totalInvestment: json['totalInvestment'],
        currentValue: json['currentValue'],
        returnPercentage: json['returnPercentage'],
        sponsorLogoUrl: json['sponsorLogoUrl'],
        changePercentage: json['changePercentage']);
  }

  final String ticker;
  final String companyName;
  final num price;
  final num quantity;
  final num buyPrice;
  final num diff;
  final String totalReturn;
  final String totalInvestment;
  final String currentValue;
  final String returnPercentage;
  final String sponsorLogoUrl;
  final num changePercentage;

  TopLosers copyWith({
    String? ticker,
    String? companyName,
    num? price,
    num? quantity,
    num? buyPrice,
    num? diff,
    String? totalReturn,
    String? totalInvestment,
    String? currentValue,
    String? returnPercentage,
    String? sponsorLogoUrl,
    num? changePercentage,
  }) =>
      TopLosers(
        ticker: ticker ?? this.ticker,
        companyName: companyName ?? this.companyName,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
        buyPrice: buyPrice ?? this.buyPrice,
        diff: diff ?? this.diff,
        totalReturn: totalReturn ?? this.totalReturn,
        totalInvestment: totalInvestment ?? this.totalInvestment,
        currentValue: currentValue ?? this.currentValue,
        returnPercentage: returnPercentage ?? this.returnPercentage,
        sponsorLogoUrl: sponsorLogoUrl ?? this.sponsorLogoUrl,
        changePercentage: changePercentage ?? this.changePercentage,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ticker'] = ticker;
    map['companyName'] = companyName;
    map['price'] = price;
    map['quantity'] = quantity;
    map['buyPrice'] = buyPrice;
    map['diff'] = diff;
    map['totalReturn'] = totalReturn;
    map['totalInvestment'] = totalInvestment;
    map['currentValue'] = currentValue;
    map['returnPercentage'] = returnPercentage;
    map['sponsorLogoUrl'] = sponsorLogoUrl;
    map['changePercentage'] = changePercentage;
    return map;
  }
}

class TopPerformers {
  TopPerformers({
    required this.ticker,
    required this.companyName,
    required this.price,
    required this.quantity,
    required this.buyPrice,
    required this.diff,
    required this.totalReturn,
    required this.totalInvestment,
    required this.currentValue,
    required this.returnPercentage,
    required this.sponsorLogoUrl,
    required this.changePercentage,
  });

  factory TopPerformers.fromJson(dynamic json) {
    return TopPerformers(
        ticker: json['ticker'],
        companyName: json['companyName'],
        price: json['price'],
        quantity: json['quantity'],
        buyPrice: json['buyPrice'],
        diff: json['diff'],
        totalReturn: json['totalReturn'],
        totalInvestment: json['totalInvestment'],
        currentValue: json['currentValue'],
        returnPercentage: json['returnPercentage'],
        sponsorLogoUrl: json['sponsorLogoUrl'],
        changePercentage: json['changePercentage']);
  }

  final String ticker;
  final String companyName;
  final num price;
  final num quantity;
  final num buyPrice;
  final num diff;
  final String totalReturn;
  final String totalInvestment;
  final String currentValue;
  final String returnPercentage;
  final String sponsorLogoUrl;
  final num changePercentage;

  TopPerformers copyWith({
    String? ticker,
    String? companyName,
    num? price,
    num? quantity,
    num? buyPrice,
    num? diff,
    String? totalReturn,
    String? totalInvestment,
    String? currentValue,
    String? returnPercentage,
    String? sponsorLogoUrl,
    num? changePercentage,
  }) =>
      TopPerformers(
        ticker: ticker ?? this.ticker,
        companyName: companyName ?? this.companyName,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
        buyPrice: buyPrice ?? this.buyPrice,
        diff: diff ?? this.diff,
        totalReturn: totalReturn ?? this.totalReturn,
        totalInvestment: totalInvestment ?? this.totalInvestment,
        currentValue: currentValue ?? this.currentValue,
        returnPercentage: returnPercentage ?? this.returnPercentage,
        sponsorLogoUrl: sponsorLogoUrl ?? this.sponsorLogoUrl,
        changePercentage: changePercentage ?? this.changePercentage,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ticker'] = ticker;
    map['companyName'] = companyName;
    map['price'] = price;
    map['quantity'] = quantity;
    map['buyPrice'] = buyPrice;
    map['diff'] = diff;
    map['totalReturn'] = totalReturn;
    map['totalInvestment'] = totalInvestment;
    map['currentValue'] = currentValue;
    map['returnPercentage'] = returnPercentage;
    map['sponsorLogoUrl'] = sponsorLogoUrl;
    map['changePercentage'] = changePercentage;
    return map;
  }
}

class MetaData {
  MetaData({
    required this.ticker,
    required this.companyName,
    required this.price,
    required this.quantity,
    required this.buyPrice,
    required this.diff,
    required this.totalReturn,
    required this.totalInvestment,
    required this.currentValue,
    required this.returnPercentage,
    required this.sponsorLogoUrl,
    required this.changePercentage,
  });

  factory MetaData.fromJson(dynamic json) {
    return MetaData(
        ticker: json['ticker'],
        companyName: json['companyName'],
        price: json['price'],
        quantity: json['quantity'],
        buyPrice: json['buyPrice'],
        diff: json['diff'],
        totalReturn: json['totalReturn'],
        totalInvestment: json['totalInvestment'],
        currentValue: json['currentValue'],
        returnPercentage: json['returnPercentage'],
        sponsorLogoUrl: json['sponsorLogoUrl'],
        changePercentage: json['changePercentage']);
  }

  final String ticker;
  final String companyName;
  final num price;
  final num quantity;
  final num buyPrice;
  final num diff;
  final String totalReturn;
  final String totalInvestment;
  final String currentValue;
  final String returnPercentage;
  final String sponsorLogoUrl;
  final num changePercentage;

  MetaData copyWith({
    String? ticker,
    String? companyName,
    num? price,
    num? quantity,
    num? buyPrice,
    num? diff,
    String? totalReturn,
    String? totalInvestment,
    String? currentValue,
    String? returnPercentage,
    String? sponsorLogoUrl,
    num? changePercentage,
  }) =>
      MetaData(
        ticker: ticker ?? this.ticker,
        companyName: companyName ?? this.companyName,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
        buyPrice: buyPrice ?? this.buyPrice,
        diff: diff ?? this.diff,
        totalReturn: totalReturn ?? this.totalReturn,
        totalInvestment: totalInvestment ?? this.totalInvestment,
        currentValue: currentValue ?? this.currentValue,
        returnPercentage: returnPercentage ?? this.returnPercentage,
        sponsorLogoUrl: sponsorLogoUrl ?? this.sponsorLogoUrl,
        changePercentage: changePercentage ?? this.changePercentage,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ticker'] = ticker;
    map['companyName'] = companyName;
    map['price'] = price;
    map['quantity'] = quantity;
    map['buyPrice'] = buyPrice;
    map['diff'] = diff;
    map['totalReturn'] = totalReturn;
    map['totalInvestment'] = totalInvestment;
    map['currentValue'] = currentValue;
    map['returnPercentage'] = returnPercentage;
    map['sponsorLogoUrl'] = sponsorLogoUrl;
    map['changePercentage'] = changePercentage;
    return map;
  }
}
