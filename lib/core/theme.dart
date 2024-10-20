import 'package:flutter/material.dart';
import 'constants/colors.dart';

final theme = ThemeData(
  useMaterial3: false,
  toggleButtonsTheme: ToggleButtonsThemeData(
    selectedColor: MagnifiColorPalette.primary.yellowGold.v400,
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: MagnifiColorPalette.primary.neutral.v900,
    selectionColor: MagnifiColorPalette.primary.neutral.v400,
    selectionHandleColor: MagnifiColorPalette.primary.neutral.v900,
  ),
  fontFamily: 'Inter',
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: MagnifiColorPalette.primary.yellowGold.v400,
    error: MagnifiColorPalette.secondary.chart.darkRed,
  ),
  canvasColor: Colors.white,
  primaryColor: MagnifiColorPalette.primary.yellowGold.v400,
  scaffoldBackgroundColor: Colors.white,
  navigationBarTheme: const NavigationBarThemeData(
    labelTextStyle: WidgetStatePropertyAll(
      TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 8),
    ),
  ),
);
