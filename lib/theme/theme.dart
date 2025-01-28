import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278216037),
      surfaceTint: Color(4278217322),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278222976),
      onPrimaryContainer: Color(4293132286),
      secondary: Color(4278197824),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4278203238),
      onSecondaryContainer: Color(4286160342),
      tertiary: Color(4284112738),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4293981432),
      onTertiaryContainer: Color(4285230963),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4287823882),
      surface: Color(4294376185),
      onSurface: Color(4279770140),
      onSurfaceVariant: Color(4282272073),
      outline: Color(4285430137),
      outlineVariant: Color(4290628040),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086257),
      inversePrimary: Color(4285978325),
      primaryFixed: Color(4287886066),
      onPrimaryFixed: Color(4278198304),
      primaryFixedDim: Color(4285978325),
      onPrimaryFixedVariant: Color(4278210383),
      secondaryFixed: Color(4292207615),
      onSecondaryFixed: Color(4278197052),
      secondaryFixedDim: Color(4289186047),
      onSecondaryFixedVariant: Color(4280239995),
      tertiaryFixed: Color(4292862951),
      onTertiaryFixed: Color(4279704607),
      tertiaryFixedDim: Color(4291020747),
      onTertiaryFixedVariant: Color(4282599243),
      surfaceDim: Color(4292336602),
      surfaceBright: Color(4294376185),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293981427),
      surfaceContainer: Color(4293652462),
      surfaceContainerHigh: Color(4293257704),
      surfaceContainerHighest: Color(4292862946),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278205757),
      surfaceTint: Color(4278217322),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278221434),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278197824),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4278203238),
      onSecondaryContainer: Color(4288726271),
      tertiary: Color(4281481018),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4285099633),
      onTertiaryContainer: Color(4294967295),
      error: Color(4285792262),
      onError: Color(4294967295),
      errorContainer: Color(4291767335),
      onErrorContainer: Color(4294967295),
      surface: Color(4294376185),
      onSurface: Color(4279046674),
      onSurfaceVariant: Color(4281153592),
      outline: Color(4282996052),
      outlineVariant: Color(4284772207),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086257),
      inversePrimary: Color(4285978325),
      primaryFixed: Color(4278221434),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278214495),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4283068068),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4281357706),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4285099633),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4283520345),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4291020743),
      surfaceBright: Color(4294376185),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293981427),
      surfaceContainer: Color(4293257704),
      surfaceContainerHigh: Color(4292468445),
      surfaceContainerHighest: Color(4291744466),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278202930),
      surfaceTint: Color(4278217322),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278211154),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278197824),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4278203238),
      onSecondaryContainer: Color(4293652735),
      tertiary: Color(4280823088),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4282731085),
      onTertiaryContainer: Color(4294967295),
      error: Color(4284481540),
      onError: Color(4294967295),
      errorContainer: Color(4288151562),
      onErrorContainer: Color(4294967295),
      surface: Color(4294376185),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4278190080),
      outline: Color(4280495662),
      outlineVariant: Color(4282403659),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086257),
      inversePrimary: Color(4285978325),
      primaryFixed: Color(4278211154),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278204729),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4280437373),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4278202981),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4282731085),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4281217846),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4290099897),
      surfaceBright: Color(4294376185),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293784305),
      surfaceContainer: Color(4292862946),
      surfaceContainerHigh: Color(4291941844),
      surfaceContainerHighest: Color(4291020743),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4285978325),
      surfaceTint: Color(4285978325),
      onPrimary: Color(4278204215),
      primaryContainer: Color(4278222976),
      onPrimaryContainer: Color(4293132286),
      secondary: Color(4289186047),
      onSecondary: Color(4278202465),
      secondaryContainer: Color(4278203238),
      onSecondaryContainer: Color(4286160342),
      tertiary: Color(4294967295),
      onTertiary: Color(4281086260),
      tertiaryContainer: Color(4292862951),
      onTertiaryContainer: Color(4284507496),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279243796),
      onSurface: Color(4292862946),
      onSurfaceVariant: Color(4290628040),
      outline: Color(4287075218),
      outlineVariant: Color(4282272073),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292862946),
      inversePrimary: Color(4278217322),
      primaryFixed: Color(4287886066),
      onPrimaryFixed: Color(4278198304),
      primaryFixedDim: Color(4285978325),
      onPrimaryFixedVariant: Color(4278210383),
      secondaryFixed: Color(4292207615),
      onSecondaryFixed: Color(4278197052),
      secondaryFixedDim: Color(4289186047),
      onSecondaryFixedVariant: Color(4280239995),
      tertiaryFixed: Color(4292862951),
      onTertiaryFixed: Color(4279704607),
      tertiaryFixedDim: Color(4291020747),
      onTertiaryFixedVariant: Color(4282599243),
      surfaceDim: Color(4279243796),
      surfaceBright: Color(4281678394),
      surfaceContainerLowest: Color(4278849295),
      surfaceContainerLow: Color(4279770140),
      surfaceContainer: Color(4280033312),
      surfaceContainerHigh: Color(4280691499),
      surfaceContainerHighest: Color(4281415221),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4287491307),
      surfaceTint: Color(4285978325),
      onPrimary: Color(4278201131),
      primaryContainer: Color(4282032031),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4291550719),
      onSecondary: Color(4278199630),
      secondaryContainer: Color(4285436618),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294967295),
      onTertiary: Color(4281086260),
      tertiaryContainer: Color(4292862951),
      onTertiaryContainer: Color(4282665292),
      error: Color(4294955724),
      onError: Color(4283695107),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279243796),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4292075486),
      outline: Color(4289246388),
      outlineVariant: Color(4287075218),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292862946),
      inversePrimary: Color(4278210897),
      primaryFixed: Color(4287886066),
      onPrimaryFixed: Color(4278195220),
      primaryFixedDim: Color(4285978325),
      onPrimaryFixedVariant: Color(4278205757),
      secondaryFixed: Color(4292207615),
      onSecondaryFixed: Color(4278194473),
      secondaryFixedDim: Color(4289186047),
      onSecondaryFixedVariant: Color(4278531689),
      tertiaryFixed: Color(4292862951),
      onTertiaryFixed: Color(4279046677),
      tertiaryFixedDim: Color(4291020747),
      onTertiaryFixedVariant: Color(4281481018),
      surfaceDim: Color(4279243796),
      surfaceBright: Color(4282467653),
      surfaceContainerLowest: Color(4278519816),
      surfaceContainerLow: Color(4279901726),
      surfaceContainer: Color(4280559913),
      surfaceContainerHigh: Color(4281283379),
      surfaceContainerHighest: Color(4282007358),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4289265662),
      surfaceTint: Color(4285978325),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4285715153),
      onPrimaryContainer: Color(4278193678),
      secondary: Color(4293587199),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4288791807),
      onSecondaryContainer: Color(4278192927),
      tertiary: Color(4294967295),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4292862951),
      onTertiaryContainer: Color(4280691502),
      error: Color(4294962409),
      onError: Color(4278190080),
      errorContainer: Color(4294946468),
      onErrorContainer: Color(4280418305),
      surface: Color(4279243796),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294967295),
      outline: Color(4293325553),
      outlineVariant: Color(4290364868),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292862946),
      inversePrimary: Color(4278210897),
      primaryFixed: Color(4287886066),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4285978325),
      onPrimaryFixedVariant: Color(4278195220),
      secondaryFixed: Color(4292207615),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4289186047),
      onSecondaryFixedVariant: Color(4278194473),
      tertiaryFixed: Color(4292862951),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4291020747),
      onTertiaryFixedVariant: Color(4279046677),
      surfaceDim: Color(4279243796),
      surfaceBright: Color(4283191633),
      surfaceContainerLowest: Color(4278190080),
      surfaceContainerLow: Color(4280033312),
      surfaceContainer: Color(4281086257),
      surfaceContainerHigh: Color(4281809980),
      surfaceContainerHighest: Color(4282599495),
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
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

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
