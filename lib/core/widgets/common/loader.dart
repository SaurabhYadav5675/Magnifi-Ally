import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:magnifi_ally/core/constants/magnifi_assets.dart';

class Loader extends StatelessWidget {
  const Loader({
    super.key,
    this.showGenericLoader = false,
    this.spinnerColor = Colors.black,
    this.height,
    this.notCentered = false,
    this.width,
    this.visible = true,
  });

  final bool visible;

  /// If true, shows a generic loader, else shows a custom loader
  final bool showGenericLoader;

  /// Color of the spinner
  final Color spinnerColor;

  /// Height of the loader
  final double? height;

  /// Width of the loader
  final double? width;

  /// If true, the loader is not centered
  ///
  /// Default: `false`
  final bool notCentered;

  Widget _loader() => Visibility(
        visible: showGenericLoader,
        replacement: Image.asset(
          MagnifiGif.assetLoader,
          height: height ?? 150,
          width: width ?? 130,
        ),
        child: Lottie.asset(
          MagnifiLottie.assetLoader,
          height: height,
          width: width,
          alignment: Alignment.center,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      replacement: const SizedBox.shrink(),
      child: Visibility(
        visible: notCentered,
        replacement: Center(child: _loader()),
        child: _loader(),
      ),
    );
  }
}
