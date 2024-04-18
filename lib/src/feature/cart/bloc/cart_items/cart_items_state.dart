part of 'cart_items_bloc.dart';

@freezed
class CartItemsState with _$CartItemsState {
  const factory CartItemsState.initial() = _Initial;

  const factory CartItemsState.loading({
    @Default([]) final List<CartItemModel> oldItems,
  }) = _Loading;

  const factory CartItemsState.success({
    required final List<CartItemModel> items,
  }) = _Success;

  const factory CartItemsState.failure({
    required final String message,
    @Default([]) final List<CartItemModel> oldItems,
  }) = _Failure;

  const factory CartItemsState.empty() = _Empty;
}
