import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            cartRepository: DependenciesScope.of(context).cartRepository,
          ),
          child: BlocConsumer<ChangedCartBloc, ChangedCartState>(
            listener: (BuildContext context, ChangedCartState state) =>
                state.mapOrNull(
              success: (state) => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Item updated in cart successfully')),
              ),
              failure: (state) => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Failed to update item in cart')),
              ),
            ),
            builder: (context, state) => CartItemCard(
              itemName: cartItems[index].merchandise.product.title,
              itemPrice: cartItems[index].cost.totalAmount.amount,
              itemQuantity: cartItems[index].quantity,
              onDeletePressed: () => context
                  .read<ChangedCartBloc>()
                  .add(ChangedCartEvent.removeItemFromCart(
                    itemId: cartItems[index].id,
                  )),
              onMinusPressed: () => context
                  .read<ChangedCartBloc>()
                  .add(ChangedCartEvent.updateItemInCart(
                    quantity: cartItems[index].quantity - 1,
                    itemId: cartItems[index].id,
                  )),
              onPlusPressed: () => context
                  .read<ChangedCartBloc>()
                  .add(ChangedCartEvent.updateItemInCart(
                    quantity: cartItems[index].quantity + 1,
                    itemId: cartItems[index].id,
                  )),
              selectedOptions: cartItems[index].merchandise.selectedOptions,
              discounts: cartItems[index].discountAllocations,
              isAvailableForSale: cartItems[index].merchandise.availableForSale,
            ),
          ),
        ),
        itemCount: cartItems.length,
      );
}
