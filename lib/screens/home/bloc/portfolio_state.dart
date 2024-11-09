import 'package:equatable/equatable.dart';
import 'package:magnifi_ally/screens/home/bloc/portfolio.dart';

class PortfolioState extends Equatable {
  final bool loading;
  final Portfolio? portfolio;

  const PortfolioState({
    this.loading = true,
    this.portfolio,
  });

  factory PortfolioState.fromJson(dynamic json) {
    return PortfolioState(portfolio: Portfolio.fromJson(json));
  }

  PortfolioState copyWith({
    bool? loading,
    Portfolio? portfolio,
  }) =>
      PortfolioState(
          loading: loading ?? this.loading,
          portfolio: portfolio ?? this.portfolio);

  @override
  List<Object?> get props => [loading, portfolio];
}
