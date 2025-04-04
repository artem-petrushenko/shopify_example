import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/core/logger.dart';
import 'package:shopify_example/src/feature/cart/data/repository/cart_repository.dart';

part 'changed_cart_event.dart';

part 'changed_cart_state.dart';

part 'changed_cart_bloc.freezed.dart';

class ChangedCartBloc extends Bloc<ChangedCartEvent, ChangedCartState> {
  ChangedCartBloc({
    required final CartRepository cartRepository,
  })  : _cartRepository = cartRepository,
        super(const _Initial()) {
    on<ChangedCartEvent>(
      (event, emit) => event.map(
        addItemToCart: (event) => _onAddItemToCart(event, emit),
        removeItemFromCart: (event) => _onRemoveItemFromCart(event, emit),
        updateItemInCart: (event) => _onUpdateItemInCart(event, emit),
      ),
    );
  }

  final CartRepository _cartRepository;

  Future<void> _onAddItemToCart(
    _AddItemToCart event,
    Emitter<ChangedCartState> emit,
  ) async {
    if (state is _Loading) return;
    try {
      emit(const _Loading());
      await _cartRepository.addProductToCart(
        productId: event.itemId,
        quantity: event.quantity,
      );
      emit(const _Success());
    } on Object catch (error, stackTrace) {
      logger.error(
        'Failed to add item to cart',
        error: error,
        stackTrace: stackTrace,
      );
      emit(const _Failure(message: 'Failed to add item to cart'));
    }
  }

  Future<void> _onRemoveItemFromCart(
    _RemoveItemFromCart event,
    Emitter<ChangedCartState> emit,
  ) async {
    if (state is _Loading) return;
    try {
      emit(const _Loading());
      await _cartRepository.removeProductFromCart(linesIds: [event.itemId]);
      emit(const _Success());
    } on Object catch (error, stackTrace) {
      logger.error(
        'Failed to remove item from cart',
        error: error,
        stackTrace: stackTrace,
      );
      emit(const _Failure(message: 'Failed to remove item from cart'));
    }
  }

  Future<void> _onUpdateItemInCart(
    _UpdateItemInCart event,
    Emitter<ChangedCartState> emit,
  ) async {
    if (state is _Loading) return;
    try {
      emit(const _Loading());
      await _cartRepository.updateProductInCart(
        lineId: event.itemId,
        quantity: event.quantity,
      );
      emit(const _Success());
    } on Object catch (error, stackTrace) {
      logger.error(
        'Failed to update item in cart',
        error: error,
        stackTrace: stackTrace,
      );
      emit(const _Failure(message: 'Failed to update item in cart'));
    }
  }
}
