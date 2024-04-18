import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_example/src/feature/cart/bloc/check_cart/check_card_cubit.dart';
import 'package:shopify_example/src/feature/cart/widget/cart_item_list.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: BlocBuilder<CheckCardCubit, CheckCardState>(
            builder: (BuildContext context, CheckCardState state) =>
                state.maybeMap(
              loading: (_) => const CircularProgressIndicator(),
              success: (state) => CartItemList(cartId: state.cartId),
              failure: (state) =>
                  Text('Failed to fetch cart: ${state.message}'),
              orElse: () => const CircularProgressIndicator(),
            ),
          ),
        ),
      );
}
