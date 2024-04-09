import 'dart:ui';

abstract interface class ColoredPalette {
  const ColoredPalette({
    required this.brightness,
  });

  final Brightness brightness;
}
