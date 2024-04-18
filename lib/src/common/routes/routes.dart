import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopify_example/src/common/scaffold/scaffold_with_nav_bar.dart';
import 'package:shopify_example/src/feature/auth/widget/login_view.dart';
import 'package:shopify_example/src/feature/cart/widget/cart_view.dart';
import 'package:shopify_example/src/feature/collection/widget/collection_details_view.dart';
import 'package:shopify_example/src/feature/collections/widget/collections_view.dart';
import 'package:shopify_example/src/feature/product_details/widget/product_details_view.dart';

part 'routes.g.dart';

class Routes {
  static const collections = '/collections';
  static const collection = '/collection';
  static const productDetails = '/productDetails';
  static const login = '/login';
  static const cart = '/cart';
}

class BranchShopData extends StatefulShellBranchData {
  const BranchShopData();
}

class BranchPersonAccountData extends StatefulShellBranchData {
  const BranchPersonAccountData();
}

class BranchCartData extends StatefulShellBranchData {
  const BranchCartData();
}

@TypedStatefulShellRoute<BottomNavigationShellRoute>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<BranchShopData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<CollectionsRoute>(path: Routes.collections),
      ],
    ),
    TypedStatefulShellBranch<BranchPersonAccountData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<LoginRoute>(path: Routes.login),
      ],
    ),
    TypedStatefulShellBranch<BranchCartData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<CartRoute>(path: Routes.cart),
      ],
    ),
  ],
)
class BottomNavigationShellRoute extends StatefulShellRouteData {
  const BottomNavigationShellRoute();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) =>
      ScaffoldWithNavBar(navigationShell: navigationShell);
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

@TypedGoRoute<CartRoute>(path: Routes.cart)
class CartRoute extends GoRouteData {
  const CartRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const CartView();
}
