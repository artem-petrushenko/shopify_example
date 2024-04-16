import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopify_example/src/feature/auth/widget/login_view.dart';
import 'package:shopify_example/src/feature/collection/widget/collection_details_view.dart';
import 'package:shopify_example/src/feature/collections/widget/collections_view.dart';
import 'package:shopify_example/src/feature/product_details/widget/product_details_view.dart';

part 'routes.g.dart';

class Routes {
  static const collections = '/collections';
  static const collection = '/collection';
  static const productDetails = '/productDetails';
  static const login = '/login';
}

@TypedGoRoute<CollectionRoute>(path: Routes.collection)
class CollectionRoute extends GoRouteData {
  final String $extra;

  const CollectionRoute(this.$extra);

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      CollectionDetailsView(collectionId: $extra);
}

@TypedGoRoute<CollectionsRoute>(path: Routes.collections)
class CollectionsRoute extends GoRouteData {
  const CollectionsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CollectionListView();
}

@TypedGoRoute<ProductDetailsRoute>(path: Routes.productDetails)
class ProductDetailsRoute extends GoRouteData {
  final String $extra;

  const ProductDetailsRoute(this.$extra);

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ProductDetailsView(id: $extra);
}

@TypedGoRoute<LoginRoute>(path: Routes.login)
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const LoginView();
}
