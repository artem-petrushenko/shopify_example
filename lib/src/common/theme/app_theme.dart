import 'package:flutter/material.dart';
import 'package:shopify_example/src/common/theme/colored_palette/colored_palette.dart';
import 'package:shopify_example/src/common/theme/extension/color/color_extension.dart';

ThemeData createTheme(ColoredPalette palette) => ThemeData(
      useMaterial3: true,
      fontFamily: 'Nunito',
      brightness: palette.brightness,
      extensions: const [
        ColorExtension(),
      ],
      progressIndicatorTheme: const ProgressIndicatorThemeData(
      ),
    );
