import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopify_example/src/common/scaffold/scaffold_with_nav_bar.dart';
import 'package:shopify_example/src/common/view_selector/profile_view_selector.dart';
import 'package:shopify_example/src/feature/cart/widget/cart_view.dart';
import 'package:shopify_example/src/feature/checkout/checkout_view.dart';
import 'package:shopify_example/src/feature/collection/widget/collection_details_view.dart';
import 'package:shopify_example/src/feature/collections/widget/collections_view.dart';
import 'package:shopify_example/src/feature/product_details/widget/product_details_view.dart';

part 'routes.g.dart';

class Routes {
  static const collections = '/collections';
  static const collection = '/collection';
  static const productDetails = '/productDetails';
  static const cart = '/cart';
  static const profile = '/profile';
  static const checkout = '/checkout';
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
        TypedGoRoute<ProfileRoute>(path: Routes.profile),
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
  Widget builder(BuildContext context,
      GoRouterState state,
      StatefulNavigationShell navigationShell,) =>
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

@TypedGoRoute<CartRoute>(path: Routes.cart)
class CartRoute extends GoRouteData {
  const CartRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const CartView();
}

@TypedGoRoute<ProfileRoute>(path: Routes.profile)
class ProfileRoute extends GoRouteData {
  const ProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const ProfileViewSelector();
}

@TypedGoRoute<CheckOutRoute>(path: Routes.checkout)
class CheckOutRoute extends GoRouteData {
  const CheckOutRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const CheckOutView();
}