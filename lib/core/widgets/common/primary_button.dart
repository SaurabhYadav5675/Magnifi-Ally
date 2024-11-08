import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magnifi_ally/core/constants/colors.dart';

import 'loader.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final Function? onTap;
  final Color? backgroundColor, shadowColor;
  final double radius;
  final Color borderColor;
  final bool elevatedButton;
  final TextStyle labelStyle;
  final Widget? preffixIcon;
  final Widget? suffixIcon;
  final bool capitalizeString;
  final Color? labelColor;
  final bool isOutlined;
  final double borderThickness;
  final double height;
  final bool loadingState;
  final double loaderSize;
  final double horizontalPadding;
  final Color loaderColor;
  final Color? splashColor;
  final double? width;
  final double? verticalPadding;

  final double fontSize;

  const PrimaryButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.capitalizeString = true,
    this.backgroundColor,
    this.radius = 50,
    this.verticalPadding = 0,
    this.borderColor = Colors.transparent,
    this.elevatedButton = false,
    this.labelStyle = const TextStyle(fontSize: 16),
    this.preffixIcon,
    this.fontSize = 15,
    this.suffixIcon,
    this.labelColor = Colors.black,
    this.isOutlined = false,
    this.borderThickness = 1.0,
    this.height = 41,
    this.loadingState = false,
    this.horizontalPadding = 15,
    this.loaderColor = const Color(0xff145B8A),
    this.splashColor,
    this.loaderSize = 41,
    this.width,
    this.shadowColor,
  }) : super(key: key);

  ButtonStyle get outlineStyle => OutlinedButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size.zero,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        foregroundColor: splashColor ?? labelColor ?? backgroundColor,
        side: BorderSide(width: borderThickness, color: borderColor),
        fixedSize: width != null ? Size(width!, height) : null,
        enableFeedback: true,
        shadowColor: shadowColor,
      );

  ButtonStyle get style => ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: verticalPadding!),
        backgroundColor:
            backgroundColor ?? MagnifiColorPalette.primary.yellowGold.v400,
        foregroundColor: splashColor ?? labelColor ?? backgroundColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(radius),
        ),
        fixedSize: width != null ? Size(width!, height) : null,
        enableFeedback: true,
        shadowColor: shadowColor,
      );

  @override
  Widget build(BuildContext context) {
    Widget labelWidget() => Text(
          capitalizeString ? label.toUpperCase() : label,
          style: labelColor == null
              ? labelStyle.copyWith(fontSize: 18)
              : labelStyle.copyWith(color: labelColor, fontSize: 18),
          textAlign: TextAlign.center,
        );
    Widget getChild() {
      if (preffixIcon != null) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            preffixIcon!,
            labelWidget(),
          ],
        );
      } else if (suffixIcon != null) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            labelWidget(),
            suffixIcon!,
          ],
        );
      } else {
        return labelWidget();
      }
    }

    if (isOutlined) {
      return SizedBox(
        height: height,
        child: loadingState
            ? SizedBox(
                height: loaderSize,
                child: Loader(
                  showGenericLoader: true,
                  spinnerColor: loaderColor,
                ),
              )
            : OutlinedButton(
                style: outlineStyle,
                onPressed: onTap == null
                    ? null
                    : () {
                        HapticFeedback.mediumImpact();
                        onTap?.call();
                      },
                child: getChild(),
              ),
      );
    }
    return elevatedButton
        ? SizedBox(
            height: height,
            child: loadingState
                ? SizedBox(
                    height: loaderSize,
                    child: Loader(
                      showGenericLoader: true,
                      spinnerColor: loaderColor,
                    ))
                : ElevatedButton(
                    style: style,
                    onPressed: onTap == null
                        ? null
                        : () {
                            HapticFeedback.mediumImpact();
                            onTap?.call();
                          },
                    child: getChild(),
                  ),
          )
        : SizedBox(
            height: height,
            child: loadingState
                ? SizedBox(
                    height: loaderSize,
                    child: Loader(
                      showGenericLoader: true,
                      spinnerColor: loaderColor,
                    ))
                : TextButton(
                    style: style,
                    onPressed: onTap == null
                        ? null
                        : () {
                            HapticFeedback.mediumImpact();
                            onTap?.call();
                          },
                    child: getChild(),
                  ),
          );
  }
}
