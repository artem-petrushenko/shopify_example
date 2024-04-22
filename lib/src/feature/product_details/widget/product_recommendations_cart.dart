import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_example/src/common/widget/ink_well/no_splash_ink_well.dart';
import 'package:shopify_example/src/feature/cart/bloc/changed_cart/changed_cart_bloc.dart';
import 'package:shopify_example/src/feature/initialization/widget/dependency_scope.dart';

class ProductRecommendationsCart extends StatelessWidget {
  const ProductRecommendationsCart({
    super.key,
    required this.title,
    required this.onTap,
    required this.merchandiseId,
  });

  final String title;
  final VoidCallback onTap;
  final String merchandiseId;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => ChangedCartBloc(
            cartRepository: DependenciesScope.of(context).cartRepository),
        child: NoSplashInkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(title),
                BlocBuilder<ChangedCartBloc, ChangedCartState>(
                    builder: (context, state) => ElevatedButton(
                          onPressed: () => context
                              .read<ChangedCartBloc>()
                              .add(ChangedCartEvent.addItemToCart(
                                itemId: merchandiseId,
                              )),
                          child: state.maybeMap(
                            loading: (state) =>
                                const CircularProgressIndicator(),
                            failure: (state) =>
                                const Icon(Icons.cancel_outlined),
                            success: (state) =>
                                const Icon(Icons.check_circle_outlined),
                            orElse: () =>
                                const Icon(Icons.add_shopping_cart_outlined),
                          ),
                        )),
              ],
            ),
          ),
        ),
      );
}
