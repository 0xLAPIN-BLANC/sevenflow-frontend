import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278218045),
      surfaceTint: Color(4278218045),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4281255545),
      onPrimaryContainer: Color(4278200852),
      secondary: Color(4281821257),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4290507209),
      onSecondaryContainer: Color(4280373813),
      tertiary: Color(4280900532),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4287213055),
      onTertiaryContainer: Color(4278198611),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294245618),
      onSurface: Color(4279639320),
      onSurfaceVariant: Color(4282206783),
      outline: Color(4285365103),
      outlineVariant: Color(4290562748),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281020972),
      inversePrimary: Color(4283424655),
      primaryFixed: Color(4285529513),
      onPrimaryFixed: Color(4278198543),
      primaryFixedDim: Color(4283424655),
      onPrimaryFixedVariant: Color(4278211117),
      secondaryFixed: Color(4290375623),
      onSecondaryFixed: Color(4278198543),
      secondaryFixedDim: Color(4288598956),
      onSecondaryFixedVariant: Color(4280176690),
      tertiaryFixed: Color(4292469503),
      onTertiaryFixed: Color(4278196548),
      tertiaryFixedDim: Color(4289709823),
      onTertiaryFixedVariant: Color(4278207129),
      surfaceDim: Color(4292140243),
      surfaceBright: Color(4294245618),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293850860),
      surfaceContainer: Color(4293456102),
      surfaceContainerHigh: Color(4293061345),
      surfaceContainerHighest: Color(4292732379),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278210090),
      surfaceTint: Color(4278218045),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278224461),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4279913519),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4283268958),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278206354),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4282675916),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294245618),
      onSurface: Color(4279639320),
      onSurfaceVariant: Color(4281943612),
      outline: Color(4283785815),
      outlineVariant: Color(4285562482),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281020972),
      inversePrimary: Color(4283424655),
      primaryFixed: Color(4278224461),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278217276),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4283268958),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4281689670),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4282675916),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4280703154),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292140243),
      surfaceBright: Color(4294245618),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293850860),
      surfaceContainer: Color(4293456102),
      surfaceContainerHigh: Color(4293061345),
      surfaceContainerHighest: Color(4292732379),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278200595),
      surfaceTint: Color(4278218045),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278210090),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278200595),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4279913519),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278198353),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4278206354),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294245618),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4279904030),
      outline: Color(4281943612),
      outlineVariant: Color(4281943612),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281020972),
      inversePrimary: Color(4289265603),
      primaryFixed: Color(4278210090),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278203675),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4279913519),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4278203675),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4278206354),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278200934),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292140243),
      surfaceBright: Color(4294245618),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293850860),
      surfaceContainer: Color(4293456102),
      surfaceContainerHigh: Color(4293061345),
      surfaceContainerHighest: Color(4292732379),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4283424655),
      surfaceTint: Color(4283424655),
      onPrimary: Color(4278204701),
      primaryContainer: Color(4278235495),
      onPrimaryContainer: Color(4278193412),
      secondary: Color(4288598956),
      onSecondary: Color(4278270238),
      secondaryContainer: Color(4279453226),
      onSecondaryContainer: Color(4289256886),
      tertiary: Color(4289709823),
      onTertiary: Color(4278201709),
      tertiaryContainer: Color(4285438454),
      onTertiaryContainer: Color(4278192677),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279112976),
      onSurface: Color(4292732379),
      onSurfaceVariant: Color(4290562748),
      outline: Color(4287009928),
      outlineVariant: Color(4282206783),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292732379),
      inversePrimary: Color(4278218045),
      primaryFixed: Color(4285529513),
      onPrimaryFixed: Color(4278198543),
      primaryFixedDim: Color(4283424655),
      onPrimaryFixedVariant: Color(4278211117),
      secondaryFixed: Color(4290375623),
      onSecondaryFixed: Color(4278198543),
      secondaryFixedDim: Color(4288598956),
      onSecondaryFixedVariant: Color(4280176690),
      tertiaryFixed: Color(4292469503),
      onTertiaryFixed: Color(4278196548),
      tertiaryFixedDim: Color(4289709823),
      onTertiaryFixedVariant: Color(4278207129),
      surfaceDim: Color(4279112976),
      surfaceBright: Color(4281547573),
      surfaceContainerLowest: Color(4278784011),
      surfaceContainerLow: Color(4279639320),
      surfaceContainer: Color(4279902492),
      surfaceContainerHigh: Color(4280560678),
      surfaceContainerHighest: Color(4281284400),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4283753619),
      surfaceTint: Color(4283424655),
      onPrimary: Color(4278197003),
      primaryContainer: Color(4278235495),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4288862128),
      onSecondary: Color(4278197003),
      secondaryContainer: Color(4285111417),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4290169599),
      onTertiary: Color(4278195257),
      tertiaryContainer: Color(4285438454),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279112976),
      onSurface: Color(4294311411),
      onSurfaceVariant: Color(4290826177),
      outline: Color(4288194458),
      outlineVariant: Color(4286089082),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292732379),
      inversePrimary: Color(4278211374),
      primaryFixed: Color(4285529513),
      onPrimaryFixed: Color(4278195464),
      primaryFixedDim: Color(4283424655),
      onPrimaryFixedVariant: Color(4278206241),
      secondaryFixed: Color(4290375623),
      onSecondaryFixed: Color(4278195464),
      secondaryFixedDim: Color(4288598956),
      onSecondaryFixedVariant: Color(4278796067),
      tertiaryFixed: Color(4292469503),
      onTertiaryFixed: Color(4278193967),
      tertiaryFixedDim: Color(4289709823),
      onTertiaryFixedVariant: Color(4278203256),
      surfaceDim: Color(4279112976),
      surfaceBright: Color(4281547573),
      surfaceContainerLowest: Color(4278784011),
      surfaceContainerLow: Color(4279639320),
      surfaceContainer: Color(4279902492),
      surfaceContainerHigh: Color(4280560678),
      surfaceContainerHighest: Color(4281284400),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4293918703),
      surfaceTint: Color(4283424655),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4283753619),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4293918703),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4288862128),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294769407),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4290169599),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279112976),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4293984240),
      outline: Color(4290826177),
      outlineVariant: Color(4290826177),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292732379),
      inversePrimary: Color(4278202649),
      primaryFixed: Color(4286906290),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4283753619),
      onPrimaryFixedVariant: Color(4278197003),
      secondaryFixed: Color(4290639051),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4288862128),
      onSecondaryFixedVariant: Color(4278197003),
      tertiaryFixed: Color(4292863743),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4290169599),
      onTertiaryFixedVariant: Color(4278195257),
      surfaceDim: Color(4279112976),
      surfaceBright: Color(4281547573),
      surfaceContainerLowest: Color(4278784011),
      surfaceContainerLow: Color(4279639320),
      surfaceContainer: Color(4279902492),
      surfaceContainerHigh: Color(4280560678),
      surfaceContainerHighest: Color(4281284400),
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
