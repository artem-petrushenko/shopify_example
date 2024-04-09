import 'package:flutter/material.dart';
import 'package:shopify_example/src/common/routes/app_router.dart';
import 'package:shopify_example/src/common/theme/app_theme.dart';
import 'package:shopify_example/src/common/theme/colored_palette/dark_colored_palette.dart';
import 'package:shopify_example/src/common/theme/colored_palette/light_colored_palette.dart';
import 'package:shopify_example/src/core/l10n/generated_class/app_localizations.dart';

/// {@template material_context}
/// [MaterialContext] is an entry point to the material context.
///
/// This widget sets locales, themes and routing.
/// {@endtemplate}
class MaterialContext extends StatelessWidget {
  /// {@macro material_context}
  const MaterialContext({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Shopify',
        themeMode: ThemeMode.dark,
        theme: createTheme(LightColoredPalette()),
        darkTheme: createTheme(DarkColoredPalette()),
        // locale: Locale(localizationUnicode, ''),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        initialRoute: AppRouter.initialRoute,
        onGenerateRoute: AppRouter.onGenerateRoute,
      );
}
