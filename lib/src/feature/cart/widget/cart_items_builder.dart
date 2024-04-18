import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_example/src/feature/cart/bloc/cart_items/cart_items_bloc.dart';
import 'package:shopify_example/src/feature/cart/bloc/changed_cart/changed_cart_bloc.dart';
import 'package:shopify_example/src/feature/cart/model/cart_item_model.dart';
import 'package:shopify_example/src/feature/cart/widget/cart_item_card.dart';
import 'package:shopify_example/src/feature/initialization/widget/dependency_scope.dart';

class CartItemsBuilder extends StatelessWidget {
  const CartItemsBuilder({
    super.key,
    required this.cartItems,
  });

  final List<CartItemModel> cartItems;

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemBuilder: (BuildContext context, int index) => BlocProvider(
          create: (context) => ChangedCartBloc(
            cartItems[index].id,
            cartRepository: DependenciesScope.of(context).cartRepository,
          ),
          child: BlocConsumer<ChangedCartBloc, ChangedCartState>(
            listener: (BuildContext context, ChangedCartState state) =>
                state.mapOrNull(
              success: (state) => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Item removed from cart')),
              ),
              failure: (state) => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Failed to remove item from cart')),
              ),
            ),
            builder: (context, state) => CartItemCard(
              itemName: cartItems[index].merchandise.product.title,
              itemPrice: cartItems[index].cost.totalAmount.amount,
              itemQuantity: cartItems[index].quantity,
              onDeletePressed: () => context
                  .read<ChangedCartBloc>()
                  .add(const ChangedCartEvent.removeItemFromCart()),
            ),
          ),
        ),
        itemCount: cartItems.length,
      );
}
