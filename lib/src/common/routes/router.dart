import 'package:go_router/go_router.dart';
import 'package:shopify_example/src/common/routes/routes.dart';

final router = GoRouter(
  initialLocation: Routes.collections,
  routes: $appRoutes,
  // redirect: [],
);
