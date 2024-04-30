import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_example/src/feature/cart/bloc/cart_cost/fetch_cart_cost_bloc.dart';
import 'package:shopify_example/src/feature/cart/widget/cart_cost_widget.dart';
import 'package:shopify_example/src/feature/initialization/widget/dependency_scope.dart';

class CartCheckoutWidget extends StatelessWidget {
  const CartCheckoutWidget({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (BuildContext context) => FetchCartCostBloc(
          cartRepository: DependenciesScope.of(context).cartRepository,
        )..add(const FetchCartCostEvent.fetchCartCost()),
        child: BlocBuilder<FetchCartCostBloc, FetchCartCostState>(
          builder: (BuildContext context, FetchCartCostState state) =>
              state.maybeMap(
            loading: (state) => const CircularProgressIndicator(),
            success: (state) => CartCostWidget(
                estimatedSubtotal:
                    '${state.cost.totalAmount.amount} ${state.cost.totalAmount.currencyCode}'),
            failure: (state) => const Text('Failed to fetch cart cost'),
            orElse: () => const CircularProgressIndicator(),
          ),
        ),
      );
}
