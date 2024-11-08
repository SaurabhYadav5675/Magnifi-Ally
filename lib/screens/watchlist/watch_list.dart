import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magnifi_ally/core/constants/colors.dart';
import 'package:magnifi_ally/screens/watchlist/bloc/watchlist_cubit.dart';
import 'package:magnifi_ally/screens/watchlist/bloc/watchlist_state.dart';

class WatchList extends StatefulWidget {
  const WatchList({super.key});

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  @override
  void initState() {
    final watch = context.read<WatchlistCubit>();
    if (watch.state.watchlist.isEmpty) {
      watch.fetchWatchlist();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WatchlistCubit, WatchlistState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state.loading
            ? const Center(
                child: SizedBox(
                    height: 40, width: 40, child: CircularProgressIndicator()))
            : state.watchlist.isEmpty
                ? const Center(child: Text("Empty data"))
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: state.watchlist.length,
                      itemBuilder: (context, index) {
                        Watchlist watchListItem = state.watchlist[index];
                        double todaysGains =
                            double.parse(watchListItem.change.toString());

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color:
                                        MagnifiColorPalette.secondary.indigo)),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      watchListItem.ticker,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Visibility(
                                      visible: watchListItem.sponsorLogoUrl
                                          .toString()
                                          .isNotEmpty,
                                      child: Image.network(
                                        watchListItem.sponsorLogoUrl.toString(),
                                        height: 30,
                                        width: 90,
                                        errorBuilder: (context, _, error) {
                                          return const SizedBox();
                                        },
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      "${watchListItem.price}",
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        watchListItem.name,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: MagnifiColorPalette
                                                .primary.neutral.v900),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 0,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 5.0, top: 2),
                                            child: Icon(
                                                todaysGains == 0
                                                    ? Icons
                                                        .keyboard_arrow_up_outlined
                                                    : todaysGains.isNegative
                                                        ? Icons
                                                            .keyboard_arrow_down_outlined
                                                        : Icons
                                                            .keyboard_arrow_up_outlined,
                                                size: 20,
                                                color: todaysGains == 0
                                                    ? MagnifiColorPalette
                                                        .primary.lightGrey.v400
                                                    : todaysGains.isNegative
                                                        ? MagnifiColorPalette
                                                            .utility.redDark
                                                        : MagnifiColorPalette
                                                            .utility.magUpDark),
                                          ),
                                          Text(
                                            "${todaysGains == 0 ? "" : !todaysGains.isNegative ? '+' : ''}${todaysGains.toStringAsFixed(2)}%",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: todaysGains == 0.0
                                                  ? MagnifiColorPalette
                                                      .primary.lightGrey.v400
                                                  : todaysGains.isNegative
                                                      ? MagnifiColorPalette
                                                          .utility.redDark
                                                      : MagnifiColorPalette
                                                          .utility.greenDark,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
      },
    );
  }
}
