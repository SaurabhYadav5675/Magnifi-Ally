import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magnifi_ally/screens/home/bloc/portfolio.dart';
import 'package:magnifi_ally/screens/home/bloc/portfolio_state.dart';
import 'package:magnifi_ally/services/network_service.dart';

class PortfolioCubit extends Cubit<PortfolioState> {
  PortfolioCubit() : super(const PortfolioState());

  Future<void> fetchPortfolio() async {
    Portfolio? portfolio;
    try {
      final response = await NetworkService.getResponse(
          url: "http://13.201.135.65:8000/portfolio");
      debugPrint("Data11 getting response $response");
      if (response.statusCode == 200) {
        final metaData = response.data['data'];
        portfolio = Portfolio.fromJson(metaData);
      }
    } catch (e) {
      debugPrint("fetching error $e");
    } finally {
      emit(state.copyWith(loading: false, portfolio: portfolio));
    }
  }
}
