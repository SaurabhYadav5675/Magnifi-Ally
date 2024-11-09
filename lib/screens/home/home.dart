import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:magnifi_ally/core/constants/colors.dart';
import 'package:magnifi_ally/screens/home/bloc/portfolio.dart';
import 'package:magnifi_ally/screens/home/bloc/portfolio_state.dart';

import 'bloc/portfolio_cubit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    final portfolio = context.read<PortfolioCubit>();
    if (portfolio.state.portfolio == null) {
      portfolio.fetchPortfolio();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PortfolioCubit, PortfolioState>(
      listener: (context, state) {},
      builder: (context, state) {
        Portfolio? portfolio = state.portfolio;
        double totalGain = double.tryParse(portfolio?.totalGain ?? "0") ?? 0;
        Color textColor = totalGain == 0.0
            ? MagnifiColorPalette.primary.lightGrey.v400
            : totalGain.isNegative
                ? MagnifiColorPalette.utility.redDark
                : MagnifiColorPalette.utility.greenDark;
        return state.loading
            ? const Center(
                child: SizedBox(
                    height: 40, width: 40, child: CircularProgressIndicator()))
            : portfolio != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 16),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    color: MagnifiColorPalette
                                        .primary.lightBlue.v400,
                                    width: 1.2)),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total Invested: ",
                                      style: TextStyle(
                                          color: MagnifiColorPalette
                                              .primary.neutral.v700,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      portfolio.totalInvestment.toString(),
                                      style: TextStyle(
                                          color: MagnifiColorPalette
                                              .primary.neutral.v900,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    const Spacer(),
                                    Icon(
                                        totalGain == 0
                                            ? Icons.keyboard_arrow_up_outlined
                                            : totalGain.isNegative
                                                ? Icons
                                                    .keyboard_arrow_down_outlined
                                                : Icons
                                                    .keyboard_arrow_up_outlined,
                                        size: 24,
                                        color: totalGain == 0
                                            ? MagnifiColorPalette
                                                .primary.lightGrey.v400
                                            : totalGain.isNegative
                                                ? MagnifiColorPalette
                                                    .utility.redDark
                                                : MagnifiColorPalette
                                                    .utility.magUpDark),
                                    Text(
                                      portfolio.totalGain,
                                      style: TextStyle(
                                          color: textColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                const Gap(6),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Current Value: ",
                                      style: TextStyle(
                                          color: MagnifiColorPalette
                                              .primary.neutral.v700,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      portfolio.currentValue.toString(),
                                      style: TextStyle(
                                          color: MagnifiColorPalette
                                              .primary.neutral.v900,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    const Spacer(),
                                    Text(
                                      "(${portfolio.totalGainPercentage}%)",
                                      style: TextStyle(
                                          color: textColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : Container();
      },
    );
  }
}
