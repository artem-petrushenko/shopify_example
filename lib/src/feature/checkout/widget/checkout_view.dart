import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_example/src/common/widget/progress_indicator/default_circular_progress_indicator.dart';
import 'package:shopify_example/src/feature/checkout/bloc/fetch_customer_default_address/fetch_customer_default_address_bloc.dart';
import 'package:shopify_example/src/feature/initialization/widget/dependency_scope.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Check Out'),
        ),
        body: BlocProvider<FetchCustomerDefaultAddressBloc>(
          create: (context) => FetchCustomerDefaultAddressBloc(
            customerRepository:
                DependenciesScope.of(context).customerRepository,
          )..add(const FetchCustomerDefaultAddressEvent.fetchAddress()),
          child: Center(
            child: BlocBuilder<FetchCustomerDefaultAddressBloc,
                FetchCustomerDefaultAddressState>(
              builder: (BuildContext context, FetchCustomerDefaultAddressState state) =>
                  state.maybeMap(
                orElse: () => DefaultCircularProgressIndicator(),
                loading: (_) => DefaultCircularProgressIndicator(),
                success: (state) => Column(
                  children: [
                    Text(state.address?.firstName ?? ''),
                  ],
                ),
                failure: (state) => Text(state.message),
              ),
            ),
          ),
        ),
      );
}
