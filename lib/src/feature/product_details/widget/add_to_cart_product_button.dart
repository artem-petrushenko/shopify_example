import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_example/src/feature/cart/bloc/changed_cart/changed_cart_bloc.dart';
import 'package:shopify_example/src/feature/initialization/widget/dependency_scope.dart';

class AddToCartProductButton extends StatelessWidget {
  const AddToCartProductButton({
    super.key,
    required this.merchandiseId,
  });

  final String merchandiseId;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (BuildContext context) => ChangedCartBloc(
          merchandiseId,
          cartRepository: DependenciesScope.of(context).cartRepository,
        ),
        child: BlocConsumer<ChangedCartBloc, ChangedCartState>(
          listener: (BuildContext context, ChangedCartState state) =>
              state.mapOrNull(
            success: (_) => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Added to cart')),
            ),
            failure: (_) => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Failed to add to cart')),
            ),
          ),
          builder: (BuildContext context, ChangedCartState state) =>
              ElevatedButton(
            onPressed: () => context
                .read<ChangedCartBloc>()
                .add(const ChangedCartEvent.addItemToCart()),
            child: state.maybeMap(
              loading: (state) => const CircularProgressIndicator(),
              failure: (state) => const Text('Failure'),
              orElse: () => const Text('Add to cart'),
            ),
          ),
        ),
      );
}
