import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magnifi_ally/screens/watchlist/bloc/watchlist_state.dart';
import 'package:magnifi_ally/services/network_service.dart';

class WatchlistCubit extends Cubit<WatchlistState> {
  WatchlistCubit() : super(const WatchlistState());

  Future<void> fetchWatchlist() async {
    List<Watchlist> watchlist = [];
    try {
      final response = await NetworkService.getResponse(
          url: "http://13.201.135.65:8000/watchList");
      if (response.statusCode == 200) {
        final metaData = response.data['data']['metaData'];
        final data = WatchlistState.fromJson(metaData);
        watchlist = data.watchlist;
      }
    } catch (e) {
      debugPrint("fetching error $e");
    } finally {
      emit(state.copyWith(loading: false, watchlist: watchlist));
    }
  }
}
