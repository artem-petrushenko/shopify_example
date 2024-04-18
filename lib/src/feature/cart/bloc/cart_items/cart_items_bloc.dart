import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/core/logger.dart';
import 'package:shopify_example/src/feature/cart/data/repository/cart_repository.dart';
import 'package:shopify_example/src/feature/cart/model/cart_item_model.dart';

part 'cart_items_event.dart';

part 'cart_items_state.dart';

part 'cart_items_bloc.freezed.dart';

class CartItemsBloc extends Bloc<CartItemsEvent, CartItemsState> {
  CartItemsBloc({
    required final CartRepository cartRepository,
  })  : _cartRepository = cartRepository,
        super(const _Initial()) {
    on<CartItemsEvent>(
      (event, emit) => event.map(
        fetchItems: (event) => _onFetchItems(event, emit),
      ),
    );
  }

  final CartRepository _cartRepository;

  List<CartItemModel> get _items => state.maybeMap(
        success: (state) => state.items,
        loading: (state) => state.oldItems,
        failure: (state) => state.oldItems,
        orElse: () => [],
      );

  Future<void> _onFetchItems(
    _FetchItems event,
    Emitter<CartItemsState> emit,
  ) async {
    if (state is _Loading) {
      event.completer?.complete();
      return;
    }
    try {
      emit(_Loading(oldItems: _items));
      final cart = await _cartRepository.fetchCartItems();
      if (cart.items.cartItems.isEmpty) {
        emit(const _Empty());
      } else {
        emit(_Success(items: cart.items.cartItems));
      }
    } on Object catch (error, stackTrace) {
      logger.error(
        'Failed to fetch cart items',
        error: error,
        stackTrace: stackTrace,
      );
      emit(_Failure(
        message: 'Failed to fetch cart items',
        oldItems: _items,
      ));
    } finally {
      event.completer?.complete();
    }
  }
}
