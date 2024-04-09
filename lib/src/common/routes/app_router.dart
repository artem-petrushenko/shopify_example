import 'package:flutter/material.dart';
import 'package:shopify_example/src/feature/home/home_view.dart';

class AppRouter {
  static const String initialRoute = '/';

  static Route<MaterialPageRoute> Function(RouteSettings settings)
      get onGenerateRoute => _generateRoute;

  static Route<MaterialPageRoute> _generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      default:
        return MaterialPageRoute(builder: (_) => const HomeView());
    }
  }
}
