import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart' as p;

extension AssetPath on String {
  String get sanitize => startsWith('/') ? substring(1) : this;
}

enum AssetType {
  svg,
  other;

  factory AssetType.fromExt(ext) {
    return switch (ext) { '.svg' => svg, _ => other };
  }
}

class AdaptiveImage extends StatelessWidget {
  const AdaptiveImage.asset(
    this.loc, {
    super.key,
    this.width,
    this.height,
    this.scale,
    this.placeholder,
    this.fit = BoxFit.contain,
    this.colorFilter,
    this.widthCalculator,
    this.heightCalculator,
  });

  final String loc;
  final String? placeholder;
  final double? width, height, scale;
  final double? Function(AssetType)? widthCalculator, heightCalculator;
  final BoxFit fit;
  final ColorFilter? colorFilter;

  @override
  Widget build(BuildContext context) {
    try {
      return switch (p.extension(loc)) {
        '.svg' => SvgPicture.asset(
            loc.sanitize.isEmpty ? (placeholder ?? loc.sanitize) : loc.sanitize,
            width: width ?? widthCalculator?.call(AssetType.svg),
            height: height ?? heightCalculator?.call(AssetType.svg),
            colorFilter: colorFilter,
            fit: fit,
            placeholderBuilder: (context) {
              if (placeholder != null) {
                return AdaptiveImage.asset(
                  placeholder!,
                  width: width,
                  height: height,
                );
              }
              return const SizedBox.shrink();
            },
          ),
        _ => Image.asset(
            loc.sanitize.isEmpty ? (placeholder ?? loc.sanitize) : loc.sanitize,
            width: width ?? widthCalculator?.call(AssetType.other),
            height: height ?? heightCalculator?.call(AssetType.other),
            fit: fit,
            scale: scale,
            errorBuilder: (context, error, stackTrace) {
              if (placeholder != null) {
                return AdaptiveImage.asset(
                  placeholder!,
                  width: width,
                  height: height,
                  scale: scale,
                );
              }
              return const SizedBox.shrink();
            },
          )
      };
    } catch (e, s) {
      debugPrint(" assets loading error in $loc $e $s");
      return const SizedBox.shrink();
    }
  }
}

class AdaptiveNetworkImage extends StatelessWidget {
  const AdaptiveNetworkImage.asset(
    this.path, {
    super.key,
    this.width,
    this.height,
    this.scale,
    this.placeholder,
    this.fit = BoxFit.contain,
    this.colorFilter,
    this.widthCalculator,
    this.heightCalculator,
  });

  final String path;
  final String? placeholder;
  final double? width, height, scale;
  final double? Function(AssetType)? widthCalculator, heightCalculator;
  final BoxFit fit;
  final ColorFilter? colorFilter;

  @override
  Widget build(BuildContext context) {
    try {
      return switch (p.extension(path)) {
        '.svg' => SvgPicture.network(
            path.sanitize.isEmpty
                ? (placeholder ?? path.sanitize)
                : path.sanitize,
            width: width ?? widthCalculator?.call(AssetType.svg),
            height: height ?? heightCalculator?.call(AssetType.svg),
            colorFilter: colorFilter,
            fit: fit,
            placeholderBuilder: (context) {
              if (placeholder != null) {
                return AdaptiveImage.asset(
                  placeholder!,
                  width: width,
                  height: height,
                );
              }
              return const SizedBox.shrink();
            },
          ),
        _ => Image.network(
            path.sanitize.isEmpty
                ? (placeholder ?? path.sanitize)
                : path.sanitize,
            width: width ?? widthCalculator?.call(AssetType.other),
            height: height ?? heightCalculator?.call(AssetType.other),
            fit: fit,
            errorBuilder: (context, error, stackTrace) {
              if (placeholder != null) {
                return AdaptiveImage.asset(
                  placeholder!,
                  width: width,
                  height: height,
                  scale: scale,
                );
              }
              return const SizedBox.shrink();
            },
          )
      };
    } catch (e, s) {
      debugPrint(" assets loading error in $path $e $s");
      return const SizedBox.shrink();
    }
  }
}
