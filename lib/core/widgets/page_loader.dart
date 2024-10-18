import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:magnifi_ally/core/constants/colors.dart';

class PageLoader extends StatelessWidget {
  const PageLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 350,
        child: Align(
          alignment: Alignment.center,
          child: SpinKitFadingCircle(
            color: MagnifiColorPalette.primary.neutral.v500,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}

class PageLoaderSm extends StatelessWidget {
  const PageLoaderSm({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 40,
        child: Align(
          alignment: Alignment.center,
          child: SpinKitFadingCircle(
            color: MagnifiColorPalette.primary.neutral.v500,
            size: 25,
          ),
        ),
      ),
    );
  }
}
