import 'package:flutter/material.dart';

class MaterialTheme {
  const MaterialTheme(this.textTheme);
  final TextTheme textTheme;

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff006565),
      surfaceTint: Color(0xff006a6a),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff008080),
      onPrimaryContainer: Color(0xffe3fffe),
      secondary: Color(0xff001e40),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff003366),
      onSecondaryContainer: Color(0xff799dd6),
      tertiary: Color(0xff5a5f62),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xfff0f4f8),
      onTertiaryContainer: Color(0xff6b6f73),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff6faf9),
      onSurface: Color(0xff181c1c),
      onSurfaceVariant: Color(0xff3e4949),
      outline: Color(0xff6e7979),
      outlineVariant: Color(0xffbdc9c8),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3131),
      inversePrimary: Color(0xff76d6d5),
      primaryFixed: Color(0xff93f2f2),
      onPrimaryFixed: Color(0xff002020),
      primaryFixedDim: Color(0xff76d6d5),
      onPrimaryFixedVariant: Color(0xff004f4f),
      secondaryFixed: Color(0xffd5e3ff),
      onSecondaryFixed: Color(0xff001b3c),
      secondaryFixedDim: Color(0xffa7c8ff),
      onSecondaryFixedVariant: Color(0xff1f477b),
      tertiaryFixed: Color(0xffdfe3e7),
      onTertiaryFixed: Color(0xff171c1f),
      tertiaryFixedDim: Color(0xffc3c7cb),
      onTertiaryFixedVariant: Color(0xff43474b),
      surfaceDim: Color(0xffd7dbda),
      surfaceBright: Color(0xfff6faf9),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f4f3),
      surfaceContainer: Color(0xffebefee),
      surfaceContainerHigh: Color(0xffe5e9e8),
      surfaceContainerHighest: Color(0xffdfe3e2),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003d3d),
      surfaceTint: Color(0xff006a6a),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff007a7a),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff001e40),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff003366),
      onSecondaryContainer: Color(0xffa0c4ff),
      tertiary: Color(0xff32373a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff696e71),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff6faf9),
      onSurface: Color(0xff0d1212),
      onSurfaceVariant: Color(0xff2d3838),
      outline: Color(0xff495554),
      outlineVariant: Color(0xff646f6f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3131),
      inversePrimary: Color(0xff76d6d5),
      primaryFixed: Color(0xff007a7a),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff005f5f),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff4a6ea4),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff30558a),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff696e71),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff515559),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc3c7c7),
      surfaceBright: Color(0xfff6faf9),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f4f3),
      surfaceContainer: Color(0xffe5e9e8),
      surfaceContainerHigh: Color(0xffd9dedd),
      surfaceContainerHighest: Color(0xffced2d2),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003232),
      surfaceTint: Color(0xff006a6a),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff005252),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff001e40),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff003366),
      onSecondaryContainer: Color(0xffebf0ff),
      tertiary: Color(0xff282d30),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff454a4d),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff6faf9),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff232e2e),
      outlineVariant: Color(0xff404b4b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3131),
      inversePrimary: Color(0xff76d6d5),
      primaryFixed: Color(0xff005252),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003939),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff224a7d),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff003265),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff454a4d),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff2e3336),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb5bab9),
      surfaceBright: Color(0xfff6faf9),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffedf2f1),
      surfaceContainer: Color(0xffdfe3e2),
      surfaceContainerHigh: Color(0xffd1d5d4),
      surfaceContainerHighest: Color(0xffc3c7c7),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff76d6d5),
      surfaceTint: Color(0xff76d6d5),
      onPrimary: Color(0xff003737),
      primaryContainer: Color(0xff008080),
      onPrimaryContainer: Color(0xffe3fffe),
      secondary: Color(0xffa7c8ff),
      onSecondary: Color(0xff003061),
      secondaryContainer: Color(0xff003366),
      onSecondaryContainer: Color(0xff799dd6),
      tertiary: Color(0xffffffff),
      onTertiary: Color(0xff2c3134),
      tertiaryContainer: Color(0xffdfe3e7),
      onTertiaryContainer: Color(0xff606568),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff101414),
      onSurface: Color(0xffdfe3e2),
      onSurfaceVariant: Color(0xffbdc9c8),
      outline: Color(0xff879392),
      outlineVariant: Color(0xff3e4949),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe3e2),
      inversePrimary: Color(0xff006a6a),
      primaryFixed: Color(0xff93f2f2),
      onPrimaryFixed: Color(0xff002020),
      primaryFixedDim: Color(0xff76d6d5),
      onPrimaryFixedVariant: Color(0xff004f4f),
      secondaryFixed: Color(0xffd5e3ff),
      onSecondaryFixed: Color(0xff001b3c),
      secondaryFixedDim: Color(0xffa7c8ff),
      onSecondaryFixedVariant: Color(0xff1f477b),
      tertiaryFixed: Color(0xffdfe3e7),
      onTertiaryFixed: Color(0xff171c1f),
      tertiaryFixedDim: Color(0xffc3c7cb),
      onTertiaryFixedVariant: Color(0xff43474b),
      surfaceDim: Color(0xff101414),
      surfaceBright: Color(0xff353a3a),
      surfaceContainerLowest: Color(0xff0a0f0f),
      surfaceContainerLow: Color(0xff181c1c),
      surfaceContainer: Color(0xff1c2020),
      surfaceContainerHigh: Color(0xff262b2b),
      surfaceContainerHighest: Color(0xff313635),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff8deceb),
      surfaceTint: Color(0xff76d6d5),
      onPrimary: Color(0xff002b2b),
      primaryContainer: Color(0xff3a9f9f),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffcbddff),
      onSecondary: Color(0xff00254e),
      secondaryContainer: Color(0xff6e92ca),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffffff),
      onTertiary: Color(0xff2c3134),
      tertiaryContainer: Color(0xffdfe3e7),
      onTertiaryContainer: Color(0xff44494c),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff101414),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd3dfde),
      outline: Color(0xffa8b4b4),
      outlineVariant: Color(0xff879392),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe3e2),
      inversePrimary: Color(0xff005151),
      primaryFixed: Color(0xff93f2f2),
      onPrimaryFixed: Color(0xff001414),
      primaryFixedDim: Color(0xff76d6d5),
      onPrimaryFixedVariant: Color(0xff003d3d),
      secondaryFixed: Color(0xffd5e3ff),
      onSecondaryFixed: Color(0xff001129),
      secondaryFixedDim: Color(0xffa7c8ff),
      onSecondaryFixedVariant: Color(0xff053669),
      tertiaryFixed: Color(0xffdfe3e7),
      onTertiaryFixed: Color(0xff0d1215),
      tertiaryFixedDim: Color(0xffc3c7cb),
      onTertiaryFixedVariant: Color(0xff32373a),
      surfaceDim: Color(0xff101414),
      surfaceBright: Color(0xff414545),
      surfaceContainerLowest: Color(0xff050808),
      surfaceContainerLow: Color(0xff1a1e1e),
      surfaceContainer: Color(0xff242929),
      surfaceContainerHigh: Color(0xff2f3333),
      surfaceContainerHighest: Color(0xff3a3f3e),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa8fffe),
      surfaceTint: Color(0xff76d6d5),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff72d2d1),
      onPrimaryContainer: Color(0xff000e0e),
      secondary: Color(0xffeaf0ff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffa1c4ff),
      onSecondaryContainer: Color(0xff000b1f),
      tertiary: Color(0xffffffff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffdfe3e7),
      onTertiaryContainer: Color(0xff262b2e),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff101414),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffe6f2f1),
      outlineVariant: Color(0xffb9c5c4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe3e2),
      inversePrimary: Color(0xff005151),
      primaryFixed: Color(0xff93f2f2),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff76d6d5),
      onPrimaryFixedVariant: Color(0xff001414),
      secondaryFixed: Color(0xffd5e3ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffa7c8ff),
      onSecondaryFixedVariant: Color(0xff001129),
      tertiaryFixed: Color(0xffdfe3e7),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffc3c7cb),
      onTertiaryFixedVariant: Color(0xff0d1215),
      surfaceDim: Color(0xff101414),
      surfaceBright: Color(0xff4c5151),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1c2020),
      surfaceContainer: Color(0xff2c3131),
      surfaceContainerHigh: Color(0xff373c3c),
      surfaceContainerHighest: Color(0xff434847),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
  final Color seed;
  final Color value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
