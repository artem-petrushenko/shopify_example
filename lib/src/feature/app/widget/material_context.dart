import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_example/src/common/routes/router.dart';
import 'package:shopify_example/src/common/theme/app_theme.dart';
import 'package:shopify_example/src/common/theme/colored_palette/dark_colored_palette.dart';
import 'package:shopify_example/src/common/theme/colored_palette/light_colored_palette.dart';
import 'package:shopify_example/src/core/l10n/generated_class/app_localizations.dart';
import 'package:shopify_example/src/feature/cart/bloc/check_cart/check_card_cubit.dart';
import 'package:shopify_example/src/feature/initialization/widget/dependency_scope.dart';

/// {@template material_context}
/// [MaterialContext] is an entry point to the material context.
///
/// This widget sets locales, themes and routing.
/// {@endtemplate}
class MaterialContext extends StatelessWidget {
  /// {@macro material_context}
  const MaterialContext({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CheckCardCubit(cartRepository: DependenciesScope.of(context).cartRepository)..fetchCart(),
          ),
        ],
        child: MaterialApp.router(
          title: 'Shopify',
          themeMode: ThemeMode.dark,
          theme: createTheme(LightColoredPalette()),
          darkTheme: createTheme(DarkColoredPalette()),
          // locale: Locale(localizationUnicode, ''),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: router,
        ),
      );
}
