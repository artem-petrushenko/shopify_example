import 'package:flutter/material.dart';
import 'package:shopify_example/src/feature/collections/widget/collections_view.dart';
import 'package:shopify_example/src/feature/products/widget/product_details_view.dart';
import 'package:shopify_example/src/feature/products/widget/products_view.dart';

class AppRouter {
  static const String initialRoute = collections;
  static const String collections = '/';
  static const String products = '/products';
  static const String productDetails = '/productDetails';

  static Route<MaterialPageRoute> Function(RouteSettings settings)
      get onGenerateRoute => _generateRoute;

  static Route<MaterialPageRoute> _generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case collections:
        return MaterialPageRoute(builder: (_) => const CollectionListView());
      case products:
        return MaterialPageRoute(builder: (_) => const ProductListView());
      case productDetails:
        return MaterialPageRoute(
          builder: (_) => ProductDetailsView(
            id: settings.arguments as String,
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => const CollectionListView());
    }
  }
}
