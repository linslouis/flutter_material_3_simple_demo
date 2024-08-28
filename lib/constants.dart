// Copyright 2021 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

// NavigationRail shows if the screen width is greater or equal to
// narrowScreenWidthThreshold; otherwise, NavigationBar is used for navigation.
const double narrowScreenWidthThreshold = 450;

const double mediumWidthBreakpoint = 1000;
const double largeWidthBreakpoint = 1500;

const double transitionLength = 500;

// Whether the user has chosen a theme color via a direct [ColorSeed] selection,
// or an image [ColorImageProvider].
enum ColorSelectionMethod {
  colorSeed,
  image,
}

enum ColorSeed {
  baseColor('M3 Baseline',Colors.yellow);
  const ColorSeed(this.label, this.color);
  final String label;
  final Color color;
}

enum ScreenSelected {
  component(0),
  color(1),
  typography(2),
  elevation(3);

  const ScreenSelected(this.value);
  final int value;
}
// Light and dark ColorSchemes made by FlexColorScheme v7.0.5.
// These ColorScheme objects require Flutter 3.7 or later.
const ColorScheme flexSchemeLight = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xff9a25ae),
  onPrimary: Color(0xffffffff),
  primaryContainer: Color(0xffffd6fe),
  onPrimaryContainer: Color(0xff35003f),
  secondary: Color(0xff665a6e),
  onSecondary: Color(0xffffffff),
  secondaryContainer: Color(0xffeeddf6),
  onSecondaryContainer: Color(0xff211829),
  tertiary: Color(0xff815344),
  onTertiary: Color(0xffffffff),
  tertiaryContainer: Color(0xffffdbd0),
  onTertiaryContainer: Color(0xff321208),
  error: Color(0xffba1a1a),
  onError: Color(0xffffffff),
  errorContainer: Color(0xffffdad6),
  onErrorContainer: Color(0xff410002),
  surface: Color(0xfffffbff),
  onSurface: Color(0xff1e1a1d),
  surfaceContainerHighest: Color(0xffecdfe8),
  onSurfaceVariant: Color(0xff4d444c),
  outline: Color(0xff7f747d),
  outlineVariant: Color(0xffd0c3cc),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xff332f32),
  onInverseSurface: Color(0xfff7eef3),
  inversePrimary: Color(0xfff9abff),
  surfaceTint: Color(0xff9a25ae),
);
const ColorScheme flexSchemeDark = ColorScheme.dark(
  primary: Color(0xff8500ff),
  onPrimary: Color(0xffeeddff),
    secondary: Color(0xffff8c00),
    onSecondary: Color(0xffffead3),
  // Your custom primary color
);
// const ColorScheme flexSchemeDark = ColorScheme(
//   brightness: Brightness.dark,
//   primary: Color(0xffff6600),
//   onPrimary: Color(0xff570066),
//   primaryContainer: Color(0xff7b008f),
//   onPrimaryContainer: Color(0xffffd6fe),
//   secondary: Color(0xffd1c1d9),
//   onSecondary: Color(0xff372c3f),
//   secondaryContainer: Color(0xff4e4256),
//   onSecondaryContainer: Color(0xffeeddf6),
//   tertiary: Color(0xfff5b8a7),
//   onTertiary: Color(0xff4c261a),
//   tertiaryContainer: Color(0xff663c2f),
//   onTertiaryContainer: Color(0xffffdbd0),
//   error: Color(0xffffb4ab),
//   onError: Color(0xff690005),
//   errorContainer: Color(0xff93000a),
//   onErrorContainer: Color(0xffffb4ab),
//   surface: Color(0xff1e1a1d),
//   onSurface: Color(0xffe9e0e4),
//   surfaceContainerHighest: Color(0xff4d444c),
//   onSurfaceVariant: Color(0xffd0c3cc),
//   outline: Color(0xff998d96),
//   outlineVariant: Color(0xff4d444c),
//   shadow: Color(0xff000000),
//   scrim: Color(0xff000000),
//   inverseSurface: Color(0xffe9e0e4),
//   onInverseSurface: Color(0xff332f32),
//   inversePrimary: Color(0xff9a25ae),
//   surfaceTint: Color(0xfff9abff),
// );
