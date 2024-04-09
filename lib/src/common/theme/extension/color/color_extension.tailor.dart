// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'color_extension.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$ColorExtensionTailorMixin on ThemeExtension<ColorExtension> {
  @override
  ColorExtension copyWith() {
    return ColorExtension();
  }

  @override
  ColorExtension lerp(
      covariant ThemeExtension<ColorExtension>? other, double t) {
    if (other is! ColorExtension) return this as ColorExtension;
    return ColorExtension();
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ColorExtension);
  }

  @override
  int get hashCode {
    return runtimeType.hashCode;
  }
}

extension ColorExtensionBuildContextProps on BuildContext {
  ColorExtension get colorExtension =>
      Theme.of(this).extension<ColorExtension>()!;
}
