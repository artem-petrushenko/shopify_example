import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'color_extension.tailor.dart';

@TailorMixin()
class ColorExtension extends ThemeExtension<ColorExtension>
    with _$ColorExtensionTailorMixin {
  const ColorExtension();
}
