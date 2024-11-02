import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magnifi_ally/screens/watchlist/bloc/watchlist_state.dart';

class WatchlistCubit extends Cubit<WatchlistState> {
  WatchlistCubit() : super(const WatchlistState());

  Future<void> fetchWatchlist() async {
    try {

    } catch (e) {
      debugPrint("fetching error $e");
    }
  }
}
