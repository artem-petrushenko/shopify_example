import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_example/src/common/widget/refresh_indicator/default_refresh_indicator.dart';
import 'package:shopify_example/src/feature/cart/bloc/cart_items/cart_items_bloc.dart';
import 'package:shopify_example/src/feature/cart/widget/cart_items_builder.dart';
import 'package:shopify_example/src/feature/initialization/widget/dependency_scope.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({
    super.key,
    required this.cartId,
  });

  final String cartId;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (BuildContext context) => CartItemsBloc(
          cartId,
          cartRepository: DependenciesScope.of(context).cartRepository,
        )..add(const CartItemsEvent.fetchItems()),
        child: BlocBuilder<CartItemsBloc, CartItemsState>(
          builder: (BuildContext context, CartItemsState state) =>
              DefaultRefreshIndicator(
            onRefresh: (completer) => context.read<CartItemsBloc>().add(
                  CartItemsEvent.fetchItems(completer: completer),
                ),
            child: state.maybeMap(
              loading: (state) => state.oldItems.isEmpty
                  ? const CircularProgressIndicator()
                  : CartItemsBuilder(cartItems: state.oldItems),
              success: (state) => CartItemsBuilder(cartItems: state.items),
              failure: (state) => state.oldItems.isEmpty
                  ? const Text('Failed to fetch cart items')
                  : CartItemsBuilder(cartItems: state.oldItems),
              empty: (_) => const Text('Cart is empty'),
              orElse: () => const CircularProgressIndicator(),
            ),
          ),
        ),
      );
}
